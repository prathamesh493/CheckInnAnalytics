from flask import Flask, render_template, session,request, redirect, url_for,flash
import mysql.connector
import datetime
from datetime import datetime, timedelta
from datetime import date
import plotly.graph_objs as go
import base64
import plotly.io as pio
import io
import pandas as pd
from PIL import Image

app = Flask(__name__)
app.secret_key = 'mysecretkey'

# create connection to MySQL database
import mysql.connector
from flask import Flask, render_template, request

app = Flask(__name__)
global current_date, next_date
current_date= datetime.now().strftime('%Y-%m-%d')
next_date = (date.today() + timedelta(days=1)).isoformat()
# create connection to MySQL database
db1 = mysql.connector.connect(
    host="localhost",
    user="root",
    password="20032003",
    database="hotel"
)

# create cursor
cursor1 = db1.cursor()
cursor1.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
        
db2 = mysql.connector.connect(
    host="localhost",
    user="root",
    password="20032003",
    database="hotel2"
)

# create cursor
cursor2 = db2.cursor()
cursor2.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
        
# set default database and cursor
db = db1
cursor = cursor1

###############

def get_bookings():
    today = date.today()
    current_bookings = []
    upcoming_bookings = []
    past_bookings = []

    # execute SQL query to get all bookings from the database
    cursor.execute("SELECT * FROM bookings")
    bookings = cursor.fetchall()

    # loop through all bookings and add them to the appropriate table
    for booking in bookings:
        checkin_date = booking[4]
        checkout_date = booking[5]

        if checkout_date < today:
            past_bookings.append(booking)
        elif checkin_date > today:
            upcoming_bookings.append(booking)
        else:
            current_bookings.append(booking)

    return current_bookings, upcoming_bookings, past_bookings
###########


# Login Page Begins :
@app.route('/', methods=['GET', 'POST'])
def index():
    global selected_value
    selected_value='TAJ | MUMBAI'
    global cursor, db
    if request.method == 'POST':
        selected_value = request.form['hotel']
        if selected_value=='TAJ | MUMBAI':
            db=db1
            cursor=cursor1
            cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
            return redirect(url_for('home'))
        else:
            db=db2
            cursor=cursor2
            cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
        return redirect(url_for('home'))
    else:
        return render_template('index.html')

# Login Page Ends


# Home Page Begins 

@app.route('/home', methods=['GET', 'POST'])
def home():
    global db, cursor
    today = date.today()
    cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
    cursor.execute('SELECT checkin, checkout FROM bookings;')
    rows = cursor.fetchall()
    occupied = 0
    for row in rows:
        checkin = datetime.strptime(str(row[0]), "%Y-%m-%d").date()
        checkout = datetime.strptime(str(row[1]), "%Y-%m-%d").date()
        if checkin <= today < checkout:
            occupied += 1
    occupancy_rate = (occupied / 50) * 100
    occupied_rooms = round(occupancy_rate)
    available_rooms = 100 - occupied_rooms


    labels = ['Occupied', 'Available']
    values = [occupied_rooms, available_rooms]
    fig = go.Figure(data=[go.Pie(labels=labels, values=values, pull=[0.1, 0])])
    colors=['#000080','#c1df54']
    fig.update_traces(hole=0.4, hoverinfo="label+percent+name", textinfo='value', 
                    textfont=dict(size=20), marker=dict(line=dict(color='#000000', width=2),colors=colors))
    fig.update_layout(margin=dict(t=0, b=0, l=0, r=0), height=350, width=350, 
                  plot_bgcolor='rgba(0,0,0,0)', paper_bgcolor='rgba(0,0,0,0)',
                  margin_pad=0)

    fig.update_layout(plot_bgcolor='rgba(0,0,0,0)', paper_bgcolor='rgba(0,0,0,0)')

    img_bytes = io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    img_base64 = base64.b64encode(img_bytes.getvalue()).decode()
    
########

    cursor.execute("SELECT roomtype, SUM(DATEDIFF(checkout, checkin) * price) FROM bookings WHERE YEAR(checkin) = YEAR(CURDATE()) GROUP BY roomtype;")
    rows = cursor.fetchall()
    totalrevenue=0
    # Extract room types and revenue data
    roomtypes = [row[0] for row in rows]
    revenue = [row[1] for row in rows]
    totalrevenue = sum([float(r) for r in revenue]) + 0.12 * sum([float(r) for r in revenue])

    # Create pie chart for revenue generated by each room type
    fig2 = go.Figure(data=[go.Pie(labels=roomtypes, values=revenue, pull=[0.1, 0.1,0.05])])
    colors = ['#000080', '#c1df54', '#a9a9a9']
    fig2.update_traces(
    hole=0.4,
    hoverinfo='label+percent',
    textinfo='value',
    textfont=dict(size=20),
    marker=dict(line=dict(color='#000000', width=2), colors=colors)  # specify the colors for the markers
)
    fig2.update_layout(
        scene=dict(
            aspectmode='data',
            camera=dict(eye=dict(x=1.5, y=1.5, z=0.5)),
            xaxis=dict(showticklabels=False, showgrid=False, zeroline=False),
            yaxis=dict(showticklabels=False, showgrid=False, zeroline=False),
            zaxis=dict(showticklabels=False, showgrid=False, zeroline=False, visible=False),
        ),
        margin=dict(t=0, b=0, l=0, r=0),
        height=350,
        width=350,
        paper_bgcolor='rgba(0,0,0,0)',  # set the background color of the figure to be transparent
        plot_bgcolor='rgba(0,0,0,0)'   # set the background color of the plot to be transparent
    )


    img_bytes2 = io.BytesIO()
    pio.write_image(fig2, img_bytes2, format='png')
    img_bytes2.seek(0)
    img_basetotal = base64.b64encode(img_bytes2.getvalue()).decode()

#########

    ocsu=0
    ocsi=0
    ocdo=0
    cursor.execute("SELECT checkin, checkout FROM bookings WHERE roomtype= 'SINGLE';")
    rows = cursor.fetchall()
    
    for row in rows:
        checkin = datetime.strptime(str(row[0]), "%Y-%m-%d").date()
        checkout = datetime.strptime(str(row[1]), "%Y-%m-%d").date()
        if checkin <= today < checkout:
            ocsi += 1

    cursor.execute("SELECT checkin, checkout FROM bookings WHERE roomtype='DOUBLE';")
    rows = cursor.fetchall()
    
    for row in rows:
        checkin = datetime.strptime(str(row[0]), "%Y-%m-%d").date()
        checkout = datetime.strptime(str(row[1]), "%Y-%m-%d").date()
        if checkin <= today < checkout:
            ocdo += 1

    cursor.execute("SELECT checkin, checkout FROM bookings WHERE roomtype='SUITE';")
    rows = cursor.fetchall()
    
    for row in rows:
        checkin = datetime.strptime(str(row[0]), "%Y-%m-%d").date()
        checkout = datetime.strptime(str(row[1]), "%Y-%m-%d").date()
        if checkin <= today < checkout:
            ocsu += 1

# Creating a Horizontal Graph
    fig3 = go.Figure()
    fig3.add_trace(go.Bar(
        y=['Suite:', 'Double Bedroom:', 'Single Bedroom:'],
        x=[ocsu, ocdo, ocsi],
        name='Rooms Occupied',
        orientation='h',
        marker=dict(
            color='rgba(246, 78, 139, 0.6)',
            line=dict(color='rgba(246, 78, 139, 1.0)', width=3)
        ),
        text=[f"{occ}/{total}  " for occ, total in [(ocsu, 10), (ocdo, 15), (ocsi, 25)]],
        textposition='inside',
        textfont=dict(
            family='Arial',
            size=14,
            color='white'
        ),
        textangle=0,
    ))
    fig3.add_trace(go.Bar(
        y=['Suite:', 'Double Bedroom:', 'Single Bedroom:'],
        x=[10 - ocsu, 15 - ocdo, 25 - ocsi],
        name='Rooms Available',
        orientation='h',
        marker=dict(
            color='rgba(58, 71, 80, 0.6)',
            line=dict(color='rgba(58, 71, 80, 1.0)', width=3)
        ),
        textposition='inside',
        textfont=dict(
            family='Arial',
            size=14,
            color='white'
        ),
        textangle=0,
    ))
    fig3.update_layout(barmode='stack', paper_bgcolor='rgba(0,0,0,0)', plot_bgcolor='rgba(0,0,0,0)')

    img_bytes3 = io.BytesIO()
    pio.write_image(fig3, img_bytes3, format='png')
    img_bytes3.seek(0)
    img_basetotal3 = base64.b64encode(img_bytes3.getvalue()).decode()



#########

    cursor.execute("SELECT checkin, checkout FROM bookings WHERE MONTH(checkin) = MONTH(CURDATE());")
    rows = cursor.fetchall()
    length_of_stays = [(checkout - checkin).days for checkin, checkout in rows]
    if len(length_of_stays)==0:
        avg_length_of_stay=0
    else:
        avg_length_of_stay = sum(length_of_stays) / len(length_of_stays)

    # Create a line chart
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=[1], y=[avg_length_of_stay], mode='lines+markers', name='Avg. Length of Stay'))
    fig.update_layout(title='Average Length of Stay This Month', xaxis_title='Month', yaxis_title='Length of Stay (Days)')

    # Convert the chart to a base64 encoded image
    img_bytes = io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    img_baseavg = base64.b64encode(img_bytes.getvalue()).decode()

##########
    query = "SELECT AVG(rating) FROM reviews"

    # Execute query
    cursor.execute(query)
    result = cursor.fetchone()

    # Extract the average rating from the result
    avg_rating = round(result[0], 2)
# Create a Plotly graph to represent the overall rating

    fig = go.Figure(go.Indicator(
    mode="gauge+number",
    value=avg_rating,
    title={'text': "Overall Rating"},
    gauge={
        'axis': {'range': [None, 5]},
        'steps': [
            {'range': [0, 1], 'color': "red"},
            {'range': [1, 2], 'color': "orange"},
            {'range': [2, 3], 'color': "yellow"},
            {'range': [3, 4], 'color': "green"},
            {'range': [4, 5], 'color': "lime"}
        ],
        'bar': {'color': '#000080'},
        'shape': 'angular',
        'threshold': {
            'line': {'color': "black", 'width': 10},
            'thickness': 1,
            'value': avg_rating
        },       
    }
))





# Convert the Plotly graph to an image with a transparent background
    img_bytes = fig.to_image(format="png", engine="kaleido", scale=1)
    img = Image.open(io.BytesIO(img_bytes))
    img = img.convert("RGBA")
    data = img.getdata()

    # Replace white pixels with transparent ones
    new_data = []
    for item in data:
        if item[0] == 255 and item[1] == 255 and item[2] == 255:
            new_data.append((255, 255, 255, 0))
        else:
            new_data.append(item)

    img.putdata(new_data)

    # Convert the image back to bytes and create a Plotly div
    img_bytes = io.BytesIO()
    img.save(img_bytes, format="png")
    div = pio.to_html(fig, include_plotlyjs=False, full_html=False)

    # Include the image in the div
    div = f'<img src="data:image/png;base64,{base64.b64encode(img_bytes.getvalue()).decode()}" width="600px" height="450px"/>' + div

    return render_template('home.html',occupancy_rate=round(occupancy_rate), img_data=img_base64,img_basetotal=img_basetotal, avg_length_of_stay=round(avg_length_of_stay), avg_stay=img_baseavg,totalrevenue=totalrevenue,img_basetotal3=img_basetotal3, fig=fig,div=div, selected_value=selected_value)

# Home Page ends


# Booking Page Begins

@app.route('/booking', methods=['GET', 'POST'])
def booking():
    error=""
    if request.method == 'POST':
        session['name']=request.form['name']
        session['email'] = request.form['email']
        session['phone'] = request.form['phone']
        session['checkin'] = request.form['checkin']
        session['checkout'] = request.form['checkout']
        session['roomtype'] = request.form['roomtype']
        cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
        # insert data into bookings table
        if session['checkin']<session['checkout']:
    # Check availability of room for the given dates
            query = "SELECT COUNT(*) FROM bookings WHERE roomtype=%s AND (%s BETWEEN checkin AND DATE_SUB(checkout, INTERVAL 1 DAY) OR %s BETWEEN DATE_ADD(checkin, INTERVAL 1 DAY) AND checkout)"
            values = (session['roomtype'], session['checkin'], session['checkout'])
            cursor.execute(query, values)
            num_bookings = cursor.fetchone()[0]
            if session['roomtype'] == 'SINGLE' and num_bookings >= 25:
                error = "Sorry, all single rooms are booked for this date range."
            elif session['roomtype'] == 'DOUBLE' and num_bookings >= 15:
                error = "Sorry, all double rooms are booked for this date range."
            elif session['roomtype'] == 'SUITE' and num_bookings >= 10:
                error = "Sorry, all suites are booked for this date range."
            else:
                # Insert data into bookings table
                query = "INSERT INTO bookings (name, email, phone, checkin, checkout, roomtype) VALUES (%s, %s, %s, %s, %s, %s)"
                values = (session['name'],session['email'], session['phone'], session['checkin'], session['checkout'], session['roomtype'])
                cursor.execute(query, values)
                db.commit()
                cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
                return redirect(url_for('booking_confirmation'))
        else:
            error="Check in Date cannot be after Checkout Date!"
            cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
    return render_template('booking.html',error=error,selected_value=selected_value,current_date=current_date,next_date=next_date)

app.secret_key = 'your-secret-key-here'
# Booking Page ends 


# Booking Confirmation

@app.route('/booking_confirmation', methods=['GET'])
def booking_confirmation():
    cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
    name=session.get('name')
    email = session.get('email')
    phone = session.get('phone')
    checkin = session.get('checkin')
    checkout = session.get('checkout')
    roomtype = session.get('roomtype')
    cursor.execute("SELECT id FROM bookings WHERE id=(SELECT max(id) FROM bookings);")
    rows = cursor.fetchall()
    for row in range(len(rows)):
        id=rows[row][0]
    
    cursor.execute("SELECT * FROM bookings WHERE name = %s AND email = %s", (name, email))
    booking = cursor.fetchone()
# calculate the total price of the customer's stay
    checkin = booking[4]
    phone=booking[3]
    checkout = booking[5]
    roomtype = booking[6]
    price = booking[7]
    pricepn=booking[7]
    total_nights = (checkout - checkin).days
    price=price*total_nights
    taxes=0.12*price
    total_price = price+taxes
    # render the bill template with the booking information and total price
    return render_template('generate_bill.html', pricepn=pricepn, id=id, name=name, email=email, roomtype=roomtype, phone=phone, taxes=taxes, price=price, booking=booking, checkin=checkin, checkout=checkout, total_nights=total_nights, total_price=total_price, selected_value=selected_value)

# Booking Confirmation Ends


# Submit Review Begins

@app.route('/submitreview', methods=['GET', 'POST'])
def submitreview():
    if request.method == 'POST':
        name = request.form['name']
        customer_id = request.form['cid']
        email = request.form['email']
        rating = int(request.form['rating'])
        review = request.form['review']

        if customer_id:
            # Check if the customer details match the details in the bookings database
            cursor.execute("SELECT * FROM bookings WHERE id = %s AND name = %s AND email = %s", (customer_id, name, email))
            result = cursor.fetchone()

            if result:
                cursor.execute("INSERT INTO reviews (name, customer_id, email, rating, review_text) VALUES (%s, %s, %s, %s, %s)", (name, customer_id, email, rating, review))
                db.commit()

                # Redirect the user to the thank you page
                return render_template('thankyou.html',selected_value=selected_value)

            # If the customer details don't match, return an error message
            error = '!!! Customer ID, Name, or Email does not match the details in the bookings !!!'
            return render_template('review.html', error=error,selected_value=selected_value)

        # If the customer_id is missing, display an error message
        flash('Customer ID is required.')

    # Render the submitreview template with the error message
    return render_template('review.html',selected_value=selected_value)


# Submit Review End



# Thank You for Submit Review Page

@app.route('/thank_you')
def thank_you():
    return render_template('thankyou.html',selected_value=selected_value)

#Thank You Page Ends 



# Review Display

@app.route('/reviews')
def reviews():
    query = "SELECT name, rating, review_text FROM reviews"
    cursor.execute(query)

    # Fetch all the reviews from the resultset
    reviews = cursor.fetchall()
    return render_template('reviewprint.html', reviews=reviews,selected_value=selected_value)

#Review Display Ends


# Staff Management

@app.route('/staffmanagement')
def staffmanagement():
    cursor.execute("SELECT * FROM staff")
    staff_list = cursor.fetchall()
    return render_template('staff.html', staff_list=staff_list,selected_value=selected_value)

# Staff Management Ends


# Add Staff Begins
@app.route('/addstaff', methods=['GET','POST'])
def addstaff():
   if request.method == 'POST':
        name = request.form['name']
        gender = request.form['gender']
        join_date = request.form['join_date']
        designation = request.form['designation']
        department = request.form['department']
        salary = request.form['salary']
        if int(salary) < 5000:
            error = "Salary should be greater than ₹ 5000"
            return render_template('addstaff.html', error=error,selected_value=selected_value)
        else:
            sql = "INSERT INTO staff (name, gender,join_date, designation, department, salary) VALUES (%s, %s, %s, %s, %s, %s)"
            val = (name,gender, join_date, designation, department, salary)
            cursor.execute(sql, val)
            db.commit()
   return render_template('addstaff.html',selected_value=selected_value)
# Add Staff Ends


# Finance Begins 

@app.route('/finance')
def finance():
    # Get the revenue data for the past 3 months
    cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
    today = datetime.now()
    three_months_ago = today - timedelta(days=90)
    query = "SELECT DATE(checkin) AS checkin_date, SUM(price) AS revenue FROM bookings WHERE checkin >= %s GROUP BY checkin_date ORDER BY checkin_date ASC"

    cursor1.execute(query, [three_months_ago])
    data = cursor1.fetchall()

    # Convert the data into a pandas dataframe
    df = pd.DataFrame(data, columns=['checkin_date', 'revenue'])
    df['checkin_date'] = pd.to_datetime(df['checkin_date'])

    # Prepare the data for the line chart
    chart_data = []
    for index, row in df.iterrows():
        chart_data.append({
            'date': row['checkin_date'].strftime('%Y-%m-%d'),
            'revenue': float(row['revenue'])
        })

    # Create the line chart using plotly
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=[data['date'] for data in chart_data], y=[data['revenue'] for data in chart_data], mode='lines', name='Revenue'))
    fig.update_layout(
    xaxis_title='Date',
    yaxis_title='Revenue',
    paper_bgcolor='rgba(0,0,0,0)',
    xaxis_title_font={'size': 20, 'family': 'Arial', 'color': 'black'},
    yaxis_title_font={'size': 20, 'family': 'Arial', 'color': 'black'}
    )
    # Save the chart as a PNG image and encode as base64
    img_bytes = io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    img_base64_finlin = base64.b64encode(img_bytes.getvalue()).decode()

    # Graph 1 end Graph 2 starts 

    today = datetime.now()
    three_months_ago = today - timedelta(days=90)
    query = "SELECT DATE(checkin) AS checkin_date, SUM(price) AS revenue FROM bookings WHERE checkin >= %s GROUP BY checkin_date ORDER BY checkin_date ASC"

    cursor2.execute(query, [three_months_ago])
    data = cursor2.fetchall()

    # Convert the data into a pandas dataframe
    df = pd.DataFrame(data, columns=['checkin_date', 'revenue'])
    df['checkin_date'] = pd.to_datetime(df['checkin_date'])

    # Prepare the data for the line chart
    chart_data = []
    for index, row in df[df['revenue'].notnull()].iterrows():
        chart_data.append({
        'date': row['checkin_date'].strftime('%Y-%m-%d'),
        'revenue': float(row['revenue'])
    })

    # Create the line chart using plotly
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=[data['date'] for data in chart_data], y=[data['revenue'] for data in chart_data], mode='lines', name='Revenue'))
    fig.update_layout(
    xaxis_title='Date',
    yaxis_title='Revenue',
    paper_bgcolor='rgba(0,0,0,0)',
    xaxis_title_font={'size': 20, 'family': 'Arial', 'color': 'black'},
    yaxis_title_font={'size': 20, 'family': 'Arial', 'color': 'black'}
    )
    # Save the chart as a PNG image and encode as base64
    img_bytes = io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    img_base64_finlin2 = base64.b64encode(img_bytes.getvalue()).decode()

####################

    # define the expenses dictionary
    salary_sum=0
    cursor.execute("SELECT SUM(salary) FROM staff")
    result = cursor.fetchone()
    salary_sum = result[0]
    miscel=300000
    now = datetime.now()
    current_month = now.month
    current_year = now.year
    cursor.execute(f"SELECT COUNT(*) FROM bookings WHERE month(checkin) = {current_month} AND year(checkin) = {current_year} AND roomtype = 'SINGLE'")
    single_occupied = cursor.fetchone()[0]
    
    cursor.execute(f"SELECT COUNT(*) FROM bookings WHERE month(checkin) = {current_month} AND year(checkin) = {current_year} AND roomtype = 'DOUBLE'")
    double_occupied = cursor.fetchone()[0]
    
    cursor.execute(f"SELECT COUNT(*) FROM bookings WHERE month(checkin) = {current_month} AND year(checkin) = {current_year} AND roomtype = 'SUITE'")
    suite_occupied = cursor.fetchone()[0]
    
    totalenergy=(single_occupied*20*15*8)+(double_occupied*30*6)+(suite_occupied*40*5)
    electric=(totalenergy*2.43)+50000
    maintenance=(single_occupied*1500)+(double_occupied*300)+(suite_occupied*4550)
    totalexpense=salary_sum+miscel+electric+maintenance
    categories = ['Salaries', 'Miscel', 'Electric', 'Maintenance']
    amounts = [salary_sum, miscel, electric, maintenance]
    amounts_text = [f"₹{rev:.2f}" for rev in amounts]
    data = [go.Bar(x=categories, y=amounts, text=amounts_text, textposition='outside')]

    layout = go.Layout(xaxis=dict(title='Expense Categories'), yaxis=dict(title='Amount'), width=700, height=500,paper_bgcolor='rgba(0,0,0,0)')

    fig = go.Figure(data=data, layout=layout)
    # convert the bar chart to a PNG image and return it to the template
    img_bytes=io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    graph = base64.b64encode(img_bytes.getvalue()).decode()

##################

    cursor.execute("SELECT roomtype, SUM(DATEDIFF(checkout, checkin) * price) FROM bookings WHERE MONTH(checkin) = MONTH(CURDATE()) GROUP BY roomtype;")
    rows = cursor.fetchall()
    # Extract room types and revenue data
    roomtypes = [row[0] for row in rows]
    revenue = [row[1] for row in rows]
    totalrevenue1 = sum([float(r) for r in revenue]) + 0.12 * sum([float(r) for r in revenue])

    
    cursor.execute("SELECT roomtype, SUM(DATEDIFF(checkout, checkin) * price) FROM bookings WHERE MONTH(checkin) = MONTH(CURDATE()) GROUP BY roomtype;")
    rows = cursor.fetchall()

    # Extract room types and revenue data
    roomtypes = [row[0] for row in rows]
    revenue = [row[1] for row in rows]

    # Create bar graph
    revenue_text = [f"₹{rev:.2f}" for rev in revenue]
    data = [go.Bar(x=roomtypes, y=revenue, text=revenue_text, textposition='outside')]

    layout = go.Layout(xaxis=dict(title='Room Type'), yaxis=dict(title='Revenue (USD)'), width=700, height=500,paper_bgcolor='rgba(0,0,0,0)')

    fig = go.Figure(data=data, layout=layout)
    # convert the bar chart to a PNG image and return it to the template
    img_bytes=io.BytesIO()
    pio.write_image(fig, img_bytes, format='png')
    img_bytes.seek(0)
    rev= base64.b64encode(img_bytes.getvalue()).decode()


    query = "SELECT DATE_FORMAT(checkin, '%b') AS month, SUM(DATEDIFF(checkout, checkin) * price) AS revenue FROM bookings WHERE checkin BETWEEN %s AND %s GROUP BY month;"
    params = (three_months_ago.strftime('%Y-%m-%d'), today.strftime('%Y-%m-%d'))
    cursor.execute(query, params)
    rows = cursor.fetchall()
    month_order = {'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6, 'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12}
    rows = sorted(rows, key=lambda row: month_order[row[0]])

    # Extract month names
    months = [row[0] for row in rows]
    months = ' - '.join(months)

    tprofit = round(float(totalrevenue1) - float(totalexpense), 2)
    totalexpense=float(totalexpense)
    cursor.execute("UPDATE bookings  SET price = CASE roomtype  WHEN 'SINGLE' THEN 2500     WHEN 'DOUBLE' THEN 5000     WHEN 'SUITE' THEN 7500     ELSE 0  END WHERE price IS NULL;")
    return render_template('finance.html',selected_value=selected_value, months=months,img_base64_finlin=img_base64_finlin, img_base64_finlin2=img_base64_finlin2,graph=graph,totalexpense=totalexpense,totalrevenue1=totalrevenue1,rev=rev,tprofit=tprofit)

# Finance Ends

# Bookings Starts

@app.route('/bookings')
def bookings():
    # get the current, upcoming, and past bookings

    current_bookings, upcoming_bookings, past_bookings = get_bookings()
   # render the bookings template and pass in the booking tables
    return render_template('bookings.html',selected_value=selected_value, current_bookings=current_bookings, upcoming_bookings=upcoming_bookings, past_bookings=past_bookings)

# Bookings Ends

# Cancel Booking Begins

def delete_booking(booking_id, email):
    try:
        cursor.execute("SELECT name,email FROM bookings WHERE id = %s", (booking_id,))
        result = cursor.fetchone()
        if result is None:
            message = f"Booking with ID {booking_id} does not exist."
        elif result[1] != email:
            message = "Email does not match booking ID."
        else:
            cursor.execute("DELETE FROM bookings WHERE id = %s", (booking_id,))
            db.commit()
            message = f"Booking with ID {booking_id} for {result[0]} has been cancelled successfully."
    except Exception as e:
        print(e)
        message = "Error cancelling booking."
    return message

@app.route('/cancel', methods=['GET', 'POST'])
def cancel():
    if request.method == 'POST':
        booking_id = request.form.get('booking_id')
        email=request.form.get('email')
        message = delete_booking(booking_id,email)
        return render_template('cancel.html', message=message,selected_value=selected_value)
    return render_template('cancel.html',selected_value=selected_value)

# Cancel Booking Ends


# About Page Begins 
@app.route('/about', methods=['GET', 'POST'])
def about():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        grievances = request.form['grievances']
        cursor.execute("INSERT INTO contact (name, email, grievances) VALUES (%s, %s, %s)", (name, email, grievances))
        db.commit()
        message = "Thank you for contacting us. We will get back to you as soon as possible."
        return render_template('about.html', message=message)
    return render_template('about.html')
# About Page Ends


# Remove Staff Begins

def delete_staff(staffid, name):
    try:
        cursor.execute("SELECT name,id FROM staff WHERE id = %s", (staffid,))
        result = cursor.fetchone()
        if result is None:
            message = f"Staff with ID {staffid} or Name {name} does not exist."
        elif result[0] != name:
            message = "Name does not match Staff ID."
        else:
            cursor.execute("DELETE FROM staff WHERE id = %s", (staffid,))
            db.commit()
            message = f"{result[0]} with ID {staffid} has been removed as a Staff successfully."
    except Exception as e:
        print(e)
        message = "Error Removing Staff."
    return message

@app.route('/removestaff', methods=['GET', 'POST'])
def removestaff():
    if request.method == 'POST':
        staffid = request.form.get('staffid')
        name=request.form.get('name')
        message = delete_staff(staffid,name)
        return render_template('removestaff.html', message=message,selected_value=selected_value)
    return render_template('removestaff.html',selected_value=selected_value)

# Remove Staff Ends


# Input for Print Bill

@app.route('/bill')
def bill():
    return render_template('bill.html',selected_value=selected_value)

# Input for Print Bill Ends


# Print Bill starts

@app.route('/generate_bill', methods=['GET','POST'])
def generate_bill():
    # get the customer's information from the form
    id = request.form.get('id')

    # validate form data
    if not id:
        error='Please fill in the customer ID field'
        return render_template('bill.html', error=error,selected_value=selected_value)
    # query the database for the customer's booking information
    cursor.execute("SELECT * FROM bookings WHERE id = %s", (id,))
    booking = cursor.fetchone()

    if not booking:
        error = 'Booking Does not exist!'
        return render_template('bill.html', error=error,selected_value=selected_value)

    # calculate the total price of the customer's stay
    checkin = booking[4]
    phone=booking[3]
    checkout = booking[5]
    roomtype = booking[6]
    price = booking[7]
    pricepn=booking[7]
    total_nights = (checkout - checkin).days
    price=price*total_nights
    taxes=0.12*price
    total_price = price+taxes

    # get the customer's name and email from the booking information
    name = booking[1]
    email = booking[2]

    # render the bill template with the booking information and total price
    return render_template('generate_bill.html', pricepn=pricepn, id=id, name=name, email=email, roomtype=roomtype, phone=phone, taxes=taxes, price=price, booking=booking, checkin=checkin, checkout=checkout, total_nights=total_nights, total_price=total_price, selected_value=selected_value)

# Print Bill ends


# Remove Review Starts

def delete_review(name):
    try:
        cursor.execute("SELECT customer_id FROM reviews WHERE name = %s", (name,))
        result = cursor.fetchone()
        if result is None:
            message = f"Customer with name {name} does not exist."
        else:
            cursor.execute("DELETE FROM reviews WHERE name = %s", (name,))
            db.commit()
            message = f"Review of {name} with ID {result[0]} has been removed successfully."
    except Exception as e:
        print(e)
        message = "Error Removing Review."
    return message

@app.route('/removereview', methods=['GET', 'POST'])
def removereview():
    if request.method == 'POST':
        staffid = request.form.get('staffid')
        name=request.form.get('name')
        if staffid:
            message = delete_review(staffid, name)
        elif name:
            message = delete_review(name)
        else:
            message = "Please provide either Customer ID or Name."
        return render_template('removerate.html', message=message,selected_value=selected_value)
    return render_template('removerate.html',selected_value=selected_value)


# Remove Review Ends
if __name__ == '__main__':
    app.run()
