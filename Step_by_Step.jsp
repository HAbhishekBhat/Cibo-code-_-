<%-- 
    Document   : Step_by_Step
    Created on : 30-Oct-2024, 11:19:26 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Recipe Guide</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        #step-display {
            font-size: 18px;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #e9e9e9;
            border-radius: 5px;
        }
        #ingredients-reminder {
            font-style: italic;
            color: #666;
            margin-bottom: 15px;
        }
        #timer {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin: 20px 0;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        #voice-mode {
            margin-top: 20px;
            text-align: center;
        }
        #voice-mode button {
            background-color: #008CBA;
        }
        #voice-mode button:hover {
            background-color: #007B9A;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin: 10px 0;
        }
        .button-container button {
            flex: 1;
        }
        button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .main-page-btn {
            background-color: #ff9800;
            margin-top: 20px;
        }
        .main-page-btn:hover {
            background-color: #f57c00;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Interactive Recipe Guide</h1>
        <div id="step-display">Welcome to the recipe guide. Click 'Next Step' to begin.</div>
        <div id="ingredients-reminder"></div>
        <div id="timer"></div>
        <div class="button-container">
            <button onclick="previousStep()" id="prevButton" disabled>Previous Step</button>
            <button onclick="nextStep()" id="nextButton">Next Step</button>
        </div>
        <button onclick="startTimer()">Start Timer</button>
        <div id="voice-mode">
            <button onclick="toggleVoiceMode()">Toggle Voice Mode</button>
        </div>
        <button onclick="goToMainPage()" class="main-page-btn">Go to Main Page</button>
    </div>

    <script>
        const recipe = [
            { step: "Preheat the oven to 350°F (175°C).", time: 0, ingredients: ["Oven"] },
            { step: "Mix flour, sugar, and baking powder in a bowl.", time: 0, ingredients: ["2 cups flour", "1 cup sugar", "2 tsp baking powder"] },
            { step: "Add eggs and milk, then mix until smooth.", time: 0, ingredients: ["2 eggs", "1 cup milk"] },
            { step: "Pour batter into a greased baking pan.", time: 0, ingredients: ["Baking pan", "Butter for greasing"] },
            { step: "Bake for 30 minutes.", time: 1800, ingredients: [] },
            { step: "Let cool for 10 minutes before serving.", time: 600, ingredients: [] }
        ];

        let currentStep = -1;
        let timerInterval;
        let voiceModeOn = false;

        function previousStep() {
            if (currentStep > 0) {
                currentStep--;
                displayStep();
                updateButtons();
            }
        }

        function nextStep() {
            currentStep++;
            if (currentStep < recipe.length) {
                displayStep();
            } else {
                document.getElementById('step-display').textContent = "Recipe completed!";
                document.getElementById('ingredients-reminder').textContent = "";
            }
            updateButtons();
        }

        function displayStep() {
            const step = recipe[currentStep];
            document.getElementById('step-display').textContent = step.step;
            document.getElementById('ingredients-reminder').textContent = 
                step.ingredients.length > 0 ? "Ingredients needed: " + step.ingredients.join(", ") : "";
            if (voiceModeOn) {
                speak(step.step);
            }
        }

        function updateButtons() {
            document.getElementById('prevButton').disabled = currentStep <= 0;
            document.getElementById('nextButton').disabled = currentStep >= recipe.length;
        }

        function startTimer() {
            clearInterval(timerInterval);
            const step = recipe[currentStep];
            if (step && step.time > 0) {
                let timeLeft = step.time;
                updateTimerDisplay(timeLeft);
                timerInterval = setInterval(() => {
                    timeLeft--;
                    updateTimerDisplay(timeLeft);
                    if (timeLeft <= 0) {
                        clearInterval(timerInterval);
                        alert("Timer finished!");
                        if (voiceModeOn) {
                            speak("Timer finished!");
                        }
                    }
                }, 1000);
            }
        }

        function updateTimerDisplay(seconds) {
            const minutes = Math.floor(seconds / 60);
            const remainingSeconds = seconds % 60;
            document.getElementById('timer').textContent = 
                `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
        }

        function toggleVoiceMode() {
            voiceModeOn = !voiceModeOn;
            alert(voiceModeOn ? "Voice mode activated" : "Voice mode deactivated");
        }

        function speak(text) {
            // This is a simple simulation of voice. In a real application, you'd use the Web Speech API.
            console.log("Speaking: " + text);
            // Actual implementation would be:
            // const utterance = new SpeechSynthesisUtterance(text);
            // window.speechSynthesis.speak(utterance);
        }

        function goToMainPage() {
            // Replace 'main.jsp' with your actual main page URL
            window.location.href = 'Welcome.jsp';
        }

        // Add this to handle keyboard navigation
        document.addEventListener('keydown', function(event) {
            if (event.key === 'ArrowLeft') {
                previousStep();
            } else if (event.key === 'ArrowRight') {
                nextStep();
            }
        });
    </script>
</body>
</html>