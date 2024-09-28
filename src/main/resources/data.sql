

INSERT INTO users (id, username, password, status, email, role) VALUES 
(1, 'mani', '1234', 'ACTIVE', 'mani@gmail.com', 'RETAILER'),
(2, 'funny', '1234', 'ACTIVE', 'funny@gmail.com', 'RETAILER');

INSERT INTO products (id, title, description, retailer_id, price, category)
VALUES 
    (1, 'Smartphone', 'Latest model smartphone', 1, 699.99, 'Electronics'),
    (2, 'Laptop', 'High performance laptop', 1, 1200.50, 'Electronics'),
    (3, 'Running Shoes', 'Comfortable running shoes', 2, 75.00, 'Footwear'),
    (4, 'Blender', 'Powerful kitchen blender', 1, 150.00, 'Home Appliances');

    
 