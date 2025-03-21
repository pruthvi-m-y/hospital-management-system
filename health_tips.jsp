<%@ page session="true" %>
<%
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
    }
    String patientName = (String) session.getAttribute("patient_name"); // Fetch patient name from session
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Tips</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
                body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background: #ffffff;
        }

        .sidebar {
            width: 250px;
            background: #007bff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            width: 90%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.4);
            transform: scale(1.05);
        }

        .logout {
            background: rgba(255, 0, 0, 0.8);
        }

        .logout:hover {
            background: rgba(255, 0, 0, 1);
        }

        .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        .health-box {
            background: linear-gradient(135deg, #f8f9fa, #e3f2fd);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            width: 50%;
            transition: all 0.3s ease-in-out;
        }

        .health-box:hover {
            transform: translateY(-5px);
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            margin: 5px 0;
            border: 1px solid #007bff;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #0056b3;
            outline: none;
            box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.5);
        }

        .health-box button {
            background: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            transition: all 0.3s ease-in-out;
        }

        .health-box button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        .result {
            font-size: 18px;
            font-weight: bold;
            margin-top: 15px;
        }

        .health-tips {
            text-align: left;
            margin-top: 15px;
            background: #d1ecf1;
            padding: 15px;
            border-left: 5px solid #007bff;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        @media screen and (max-width: 768px) {
            .content {
                padding: 10px;
            }

            .health-box {
                width: 90%;
            }

            .input-group input {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="patient_dashboard.jsp"><i class="fa-solid fa-calendar-check"></i> Home</a>
        <a href="book_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Book Appointment</a>
        <a href="view_appointments.jsp"><i class="fa-solid fa-list"></i> View Appointments</a>
        <a href="health_tips.jsp"><i class="fa-solid fa-heartbeat"></i> Health Tips</a>
        <a href="logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <div class="content">
        <h2><%= patientName != null ? patientName : "Patient" %>! Get your personalized health tips below:</h2>
        <div class="health-box">
            <div class="input-group">
                <input type="number" id="height" placeholder="Height (in inches)">
                <input type="number" id="weight" placeholder="Weight (kg)">
            </div>
            <button onclick="calculateBMI()">Get Health Advice</button>
            <p class="result" id="bmiResult"></p>
            <div class="health-tips">
                <p id="healthAdvice"></p>
                <p id="waterIntake"></p>
                <p id="exercise"></p>
                <p id="steps"></p>
                <p id="additionalTips"></p>
            </div>
        </div>
    </div>

    <script>
        function calculateBMI() {
            let patientName = "<%= patientName %>";  // Get patient name from JSP
            let height = parseFloat(document.getElementById('height').value);
            let weight = parseFloat(document.getElementById('weight').value);

            if (height > 0 && weight > 0) {
                let bmi = (weight / ((height * 0.0254) * (height * 0.0254))).toFixed(2);
                document.getElementById('bmiResult').innerText = patientName + ", your BMI is: " + bmi;

                let advice = "";
                let waterIntake = "";
                let exercise = "";
                let steps = "";
                let additionalTips = "";

                if (bmi < 18.5) {
                    advice = "You are underweight. Increase calorie intake with nutrient-rich foods.";
                    waterIntake = "Drink at least 2.5 - 3 liters of water daily.";
                    exercise = "Strength training, yoga, and resistance exercises are recommended.";
                    steps = "Walk at least 8,000 steps per day.";
                    additionalTips = "Eat more protein-rich and carbohydrate-rich foods, and avoid skipping meals.";
                } 
                else if (bmi >= 18.5 && bmi < 24.9) {
                    advice = "You have a healthy weight. Maintain a balanced diet and regular exercise.";
                    waterIntake = "Drink at least 3 - 3.5 liters of water daily.";
                    exercise = "Mix of cardio (running, cycling) and strength training is best.";
                    steps = "Walk at least 10,000 steps per day.";
                    additionalTips = "Continue eating a well-balanced diet and getting enough sleep.";
                } 
                else {
                    advice = "You are overweight. Focus on a calorie-deficit diet and regular exercise.";
                    waterIntake = "Drink at least 4 liters of water daily.";
                    exercise = "Aerobic exercises like brisk walking, jogging, or swimming.";
                    steps = "Walk at least 12,000 steps per day.";
                    additionalTips = "Reduce sugar intake, eat more fiber, and avoid late-night snacks.";
                }

                document.getElementById('healthAdvice').innerText = advice;
                document.getElementById('waterIntake').innerText = waterIntake;
                document.getElementById('exercise').innerText = exercise;
                document.getElementById('steps').innerText = steps;
                document.getElementById('additionalTips').innerText = additionalTips;
            } else {
                document.getElementById('bmiResult').innerText = "Please enter valid height and weight.";
            }
        }
    </script>
</body>
</html>
