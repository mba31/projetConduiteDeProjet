<!DOCTYPE html> 
<html lang="fr"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conte Interactif</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bubblegum+Sans&display=swap">
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Bubblegum Sans', cursive;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            text-align: center;
            color: white;
            overflow: hidden;
            position: relative;
        }
    
        #menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 50px;
        }

        .story-button {
            padding: 12px 25px;
            font-size: 1.2em;
            background-color: #3b82f6;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    
        #dialogue-box {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            border-radius: 10px;
            max-width: 90%;
            font-size: 1.4em;
            font-weight: bold;
            margin-bottom: 20px;
            border: 2px solid white;
        }
    
        #story-image {
            width: 230px;
            height: 230px;
            max-width: 90%;
            object-fit: contain;
            border-radius: 50%;
            border: 5px solid white;
            padding: 20px;
            background-color: white;
            margin-bottom: 20px;
        }
    
        #controls {
            width: 100%;
            display: flex;
            justify-content: space-between;
            position: absolute;
            bottom: 20px;
            left: 0;
            padding: 0 20px;
        }
    
        #prev-button, #next-button {
            padding: 12px 25px;
            font-size: 1.2em;
            background-color: #3b82f6;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    
        #next-button:disabled, #prev-button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div id="menu">
        <button class="story-button" onclick="selectStory('HanselEtGretel')">Hansel et Gretel</button>
        <button class="story-button" onclick="selectStory('autreHistoire')">Autre Histoire</button>
    </div>
    <div id="story-container" style="display: none;">
        <div id="dialogue-box">
            <p id="story-text"></p>
        </div>
        <img id="story-image" src="" alt="Illustration du conte">
        <div id="controls">
            <button id="prev-button" onclick="prevPart()">← Précédent</button>
            <button id="next-button" onclick="nextPart()">Continuer →</button>
        </div>
    </div>

    <script>
        const stories = {
            "HanselEtGretel": [
                { text: "Il était une fois un petit garçon nommé Hansel et sa sœur Gretel.", image: "images/neutre.jpg" },
                { text: "Leur famille était très pauvre et vivait au bord d'une grande forêt.", image: "images/triste.jpg"},
                { text: "Un jour, leurs parents décidèrent de les emmener dans la forêt...", image: "images/neutre.jpg" },
                { text: "Perdus et affamés, ils découvrirent une maison faite de pain d'épices.", image: "images/heureux.jpg" }, 
                { text: "Ils s'approchèrent de la maison et commencèrent à manger les murs en pain d'épices.", image: "images/joyeux.jpg" },
                { text: "Soudain, une vieille femme sortit de la maison et les invita à entrer.", image: "images/méfiant.jpg" },
                { text: "Mais en réalité, c'était une sorcière qui voulait les capturer !", image: "images/effrayé.jpg" }
            ],
            "autreHistoire": [
                { text: "Ceci est une autre histoire qui peut être ajoutée plus tard.", image: "images/autre.jpg" }
            ]
        };
    
        let currentStory = [];
        let index = 0;
        
        function selectStory(storyKey) {
            currentStory = stories[storyKey];
            index = 0;
            document.getElementById("menu").style.display = "none";
            document.getElementById("story-container").style.display = "block";
            updateStory();
        }
    
        function updateStory() {
            if (index >= 0 && index < currentStory.length) {
                document.getElementById("story-text").innerText = currentStory[index].text;
                document.getElementById("story-image").src = currentStory[index].image;
            }
            document.getElementById("prev-button").disabled = index === 0;
            document.getElementById("next-button").disabled = index === currentStory.length - 1;
        }
        
        function nextPart() {
            if (index < currentStory.length - 1) {
                index++;
                updateStory();
            }
        }
        
        function prevPart() {
            if (index > 0) {
                index--;
                updateStory();
            }
        }
    </script>
</body>
</html>
