<%-- 
    Document   : SSL
    Created on : 27-Oct-2024, 10:47:44 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vegetarian Recipe Shopping List Generator</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
      * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .content-wrapper {
            display: flex;
            gap: 30px;
            margin-top: 30px;
        }

        .recipe-list, .shopping-list {
            flex: 1;
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        h2 {
            color: #34495e;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }

        .recipe-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin: 15px 0;
            transition: transform 0.3s ease;
            border: 1px solid #e9ecef;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .recipe-card h3 {
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 1.2em;
        }

        .recipe-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .ingredients-preview {
            margin-top: 8px;
            font-size: 0.9em;
            color: #666;
        }

        .shopping-item {
            display: flex;
            align-items: center;
            padding: 10px;
            margin: 5px 0;
            background: #f8f9fa;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .shopping-item:hover {
            background: #e9ecef;
        }

        .shopping-item input[type="checkbox"] {
            margin-right: 10px;
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .shopping-item span {
            flex: 1;
            font-size: 1.1em;
            color: #2c3e50;
        }

        .checked {
            text-decoration: line-through;
            color: #95a5a6 !important;
        }

        .buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        button {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .add-btn {
            background-color: #2ecc71;
            color: white;
        }

        .add-btn:hover {
            background-color: #27ae60;
        }

        .remove-btn {
            background-color: #e74c3c;
            color: white;
        }

        .remove-btn:hover {
            background-color: #c0392b;
        }

        .print-btn {
            background-color: #3498db;
            color: white;
        }

        .print-btn:hover {
            background-color: #2980b9;
        }

        .shop-btn {
            background-color: #9b59b6;
            color: white;
        }

        .shop-btn:hover {
            background-color: #8e44ad;
        }

        .delete-btn {
            background: none;
            border: none;
            color: #e74c3c;
            cursor: pointer;
            padding: 5px;
            margin-left: 10px;
        }

        .delete-btn:hover {
            color: #c0392b;
        }

        .empty-list {
            text-align: center;
            color: #95a5a6;
            padding: 20px;
            font-style: italic;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-utensils"></i> Vegetarian Recipe Shopping List</h1>

        <div class="content-wrapper">
            <div class="recipe-list">
                <h2><i class="fas fa-book"></i> Available Recipes</h2>
                <div id="recipes">
                    <div class="recipe-card">
                        <h3>Dal Tadka</h3>
                        <div class="recipe-buttons">
                            <button class="add-btn" onclick="addRecipe()">
                                <i class="fas fa-plus"></i> Add to List
                            </button>
                            <button class="remove-btn" onclick="removeRecipe()">
                                <i class="fas fa-minus"></i> Remove
                            </button>
                        </div>
                        <div class="ingredients-preview">
                            <small>1 cup yellow dal, 2 tomatoes, 1 onion, ...</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="shopping-list">
                <h2><i class="fas fa-shopping-cart"></i> Shopping List</h2>
                <div id="shopping-items"></div> 
                <div class="buttons">
                    <button class="print-btn" onclick="printList()">
                        <i class="fas fa-print"></i> Print List
                    </button>
                    <button class="shop-btn" onclick="openOnlineStore()">
                        <i class="fas fa-shopping-basket"></i> Shop Online
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const ingredientsForDalTadka = [
            "1 cup yellow dal",
            "2 tomatoes",
            "1 onion",
            "2 green chilies",
            "Cumin seeds",
            "Turmeric powder",
            "Ginger-garlic paste",
            "Fresh coriander"
        ];

        let selectedIngredients = new Set();

        function addRecipe() {
            ingredientsForDalTadka.forEach(ingredient => selectedIngredients.add(ingredient));
            updateShoppingList();
        }

        function removeRecipe() {
            ingredientsForDalTadka.forEach(ingredient => selectedIngredients.delete(ingredient));
            updateShoppingList();
        }

        function updateShoppingList() {
            const shoppingContainer = document.getElementById('shopping-items');
            shoppingContainer.innerHTML = '';
            Array.from(selectedIngredients).forEach(ingredient => {
                const item = document.createElement('div');
                item.className = 'shopping-item';
                item.innerHTML = `
                    <input type="checkbox" onchange="toggleItem(this)">
                    <span>${ingredient}</span>
                    <button class="delete-btn" onclick="removeItem('${ingredient}')">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                `;
                shoppingContainer.appendChild(item);
            });
        }

        function toggleItem(checkbox) {
            checkbox.parentElement.querySelector('span').classList.toggle('checked');
        }

        function removeItem(ingredient) {
            selectedIngredients.delete(ingredient);
            updateShoppingList();
        }

        function printList() {
            // ... (Your printList function implementation) ...
        }

        function openOnlineStore() {
            // ... (Your openOnlineStore function implementation) ...
        } 
    </script>
</body>
</html>
