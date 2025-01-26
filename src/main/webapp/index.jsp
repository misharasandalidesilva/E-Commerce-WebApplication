<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lulus Fashion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #ffc1c1;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            font-family: KDDESIE;
        }
        .form-control {
            width: auto;
            display: inline-block;
        }
        .hero-section img {
            height: 300px;
            object-fit: cover;
        }
        .filter-section {
            background: #ffc1c1;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .btn-pink {
            background-color: #b8354c; /* Light pink */
            color: white;
        }
        .btn-pink:hover {
            background-color: #781e2d; /* Slightly darker pink */
            color: white;
        }
        .btn-outline-pink{
            background-color: #da6879;
        }
        .btn-outline-pink:hover{
            background-color: #781e2d;
            color: white;
        }
        .form-check-input{
            background-color: #da6879;
        }
        #cart_section {
            display: contents;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 25px;
            margin-right: 100px;
        }
        .my-4 {
            margin-top: 3.5rem;
        }
        .card p-3 {
            border: 3px solid #da6879; /* Light gray border */
            border-radius: 8px; /* Rounded corners */
            padding: 16px; /* Inner spacing */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            background-color: #ffffff; /* White background */
            transition: transform 0.3s, box-shadow 0.3s; /* Smooth hover effect */
        }

        .product-card:hover {
            transform: translateY(-5px); /* Slight lift on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* More pronounced shadow */
        }

        .product-card img {
            border-radius: 4px; /* Round the edges of the image */
            max-width: 60%; /* Responsive image */
            height: auto; /* Maintain aspect ratio */
            margin-bottom: 10px; /* Spacing below the image */
            margin-right: 50px;
            margin-right: 50px;
        }

        .product-card .product-title {
            font-weight: 600; /* Bold title */
            font-size: 1rem;
            margin: 10px 0;
            color: #333; /* Darker text color */
        }

        .product-card .product-price {
            font-weight: 700; /* Bold price */
            color: #28a745; /* Green price color */
            font-size: 1.2rem;
        }

        .btn-add-to-cart {
            background-color: #ff69b4; /* Pink button */
            color: #fff; /* White text */
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 150px;
            height: 40px;
        }

        .btn-add-to-cart:hover {
            background-color: #ff85c2; /* Lighter pink on hover */
        }

        /* About Us Section */
        .about-us{
            background-color: #f3c8e3;
        }
        .col-lg-6 h2 {
            color: #b8354c;
        }

        .col-lg-6 p {
            font-size: 1.1rem;
            line-height: 1.8;
        }

        /* Mission Section */
        .mission-box {
            background: #ffe6f3;
            border-radius: 10px;
            padding: 20px;
            border: 2px solid #ffb6d8;
        }
        .mission-box h5 {
            color: #b8354c;
        }

        /* Team Section */
        .team{
            background-color: #f3c8e3;
        }
        .team-photo img {
            border-radius: 10px;
            border: 1px solid #ff8fdc;

        }
        .team-photo h5 {
            color: #ff6bb4;
        }
        .team-photo p {
            color: #666;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fffafc;
            color: #333;
        }
        .contact-form {
            background: #ffe6f3;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .contact-form .btn-custom {
            background-color: #ff6bb4;
            color: white;
            border: none;
        }
        .contact-form .btn-custom:hover {
            background-color: #ff4a9a;
        }
        .contact-info {
            background: #f8c4e7;
            color: #514d4d;
            padding: 30px;
            border-radius: 15px;
        }
        .contact-info h5 {
            font-weight: bold;
        }
        .contact-info p {
            margin: 10px 0;
        }
        .contact-info a {
            color: #aaa2a2;
            text-decoration: underline;
        }
        footer {
            background-color: #ffd6e8;
            color: #333;
            padding: 20px 0;
            text-align: center;
        }

    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Lulus Fashion</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Products
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">moose</a></li>
                        <li><a class="dropdown-item" href="#">Jezza</a></li>
                        <li><a class="dropdown-item" href="#">Gucci</a></li>
                        <li><a class="dropdown-item" href="#">Pink</a></li>
                        <li><a class="dropdown-item" href="#">aurelia</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories

                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Frock</a></li>
                        <li><a class="dropdown-item" href="#">Trousers</a></li>
                        <li><a class="dropdown-item" href="#">T-shirts</a></li>
                        <li><a class="dropdown-item" href="#">Shirts</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#About-Us">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Contact-Us">Contact Us</a>
                </li>
            </ul>
            <form class="d-flex mx-auto" role="search">
                <input class="form-control me-2" type="search" placeholder="Search Clothes" aria-label="Search">
                <button class="btn btn-pink" type="submit">Search</button>
            </form>

            <div class="ms-auto">
                <a href="LoginForm.jsp" class="btn btn-outline-pink btn-sm">Login</a>
                <a href="RegisterForm.jsp" class="btn btn-pink btn-sm">Register</a>
            </div>
            <div>
                <a href="AdminDashboard.jsp" class="btn btn-outline-pink btn-sm">Admin Dashboard</a>
            </div>

        </div>
    </div>
</nav>



<!-- Hero Section -->
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="assests/Slide/Slide-01.jpg" class="d-block w-100" alt="Clothing photo" height="600" width="1400">
        </div>
        <div class="carousel-item">
            <img src="assests/Slide/Slide-02.jpg" class="d-block w-100" alt="Clothing photo" height="600" width="1400">
        </div>
        <div class="carousel-item">
            <img src="assests/Slide/Slide-03.jpg" class="d-block w-100" alt="Clothing photo" height="600" width="1400">
        </div>
        <div class="carousel-item">
            <img src="assests/Slide/Slide-04.jpg" class="d-block w-100" alt="Clothing photo" height="600" width="1400" >
        </div>
        <div class="carousel-item">
            <img src="assests/Slide/Slide-05.jpg" class="d-block w-100" alt="Clothing photo" height="600" width="1400">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Main Section -->
<div class="container my-4 col-md-10">
    <div class="row">
        <!-- Filter Section -->
        <div class="col-md-3">
            <div class="filter-section">
                <h5>Search Smartly</h5>
                <form>
                    <div class="mb-3">
                        <label for="selectBrand" class="form-label">Select Brand</label>
                        <select id="selectBrand" class="form-select">
                            <option selected>Select Brand</option>
                            <option>moose</option>
                            <option>Jezza</option>
                            <option>Gucci</option>
                            <option>Pink</option>
                            <option>aurelia</option>

                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="selectCloth" class="form-label">Select Clothes</label>
                        <select id="selectCloth" class="form-select">
                            <option selected>Select Clothes</option>
                            <option>Frock</option>
                            <option>Trousers</option>
                            <option>T-shirts</option>
                            <option>Shirts</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="selecttrouserSizes" class="form-label">Select Trouser Sizes</label>
                        <select id="selecttrouserSizes" class="form-select">
                            <option selected>Select Trouser Size</option>
                            <option>28</option>
                            <option>30</option>
                            <option>32</option>
                            <option>34</option>
                            <option>36</option>
                            <option>38</option>
                            <option>40</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="selectSizeChart" class="form-label">Select All Sizes</label>
                        <select id="selectSizeChart" class="form-select">
                            <option selected>Select All Sizes</option>
                            <option>S</option>
                            <option>M</option>
                            <option>L</option>
                            <option>XL</option>
                            <option>XXL</option>
                            <option>XXXL</option>
                        </select>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label-pink" for="flexRadioDefault1">
                            Under Price Rs.10000
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                            Under Price Rs.5000
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
                        <label class="form-check-label" for="flexRadioDefault3">
                            Under Price Rs.3000
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4">
                        <label class="form-check-label" for="flexRadioDefault4">
                            Under Price Rs.1500
                        </label>
                    </div>

                    <button type="submit" class="btn btn-pink w-100">Search</button>
                </form>
            </div>
        </div>

        <!-- Product Section -->
        <div id="cart_section" class="row justify-content-center py-4">
            <!-- Product Card -->
            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <!-- Repeat Product Card for more items -->

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">Rs.2990.00</h5>
                        <p class="text-danger mb-1">Stock: 40</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
                <div class="card p-3" style="max-width: 400px; margin: auto; border: 3px solid #da6879 ">
                    <div class="text-center">
                        <img src="assests/HomePage/Womens-Traveler-pant-Moose-Clothing-Company-400x605.png" alt="Product Image" class="img-fluid rounded">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-title text-muted">Brand: moose</h6>
                        <p class="card-text">Moose Women’s Traveler Pant</p>
                        <h5 class="text-success mb-1">₹1000/- <span class="text-muted text-decoration-line-through">₹3999</span> <span class="text-success">75% off</span></h5>
                        <p class="text-danger mb-1">Stock: 60</p>
                        <button class="btn btn-add-to-cart">ADD TO CART</button>
                    </div>
                </div>
            </div>

            <!-- About Us Section -->
            <div class="about-us" id="About-Us">
                <div class="container my-5">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <h2>About Us</h2>
                            <p>
                                At Lulus Fashion, we create timeless styles that inspire confidence and grace.
                                Our mission is to bring modern elegance to life with each of our designs, offering
                                fashion for every moment.
                            </p>
                            <p>
                                With a commitment to quality and creativity, Lulus Fashion is your destination for
                                style that reflects sophistication and individuality.
                            </p>
                        </div>
                        <div class="col-lg-6 text-center">
                            <img src="assests/HomePage/happy-byer-shopping-bags-standing-600nw-1927526819.webp" alt="Fashion Image" class="img-fluid rounded shadow-lg">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Mission Section -->
            <div class="container my-5">
                <div class="row text-center g-4">
                    <div class="col-md-4">
                        <div class="mission-box">
                            <h5>Our Mission</h5>
                            <p>To empower individuals with fashion that makes them feel bold, beautiful, and unique.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="mission-box">
                            <h5>Our Vision</h5>
                            <p>To be a global leader in contemporary fashion, setting trends and redefining style standards.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="mission-box">
                            <h5>Our Values</h5>
                            <p>Quality, creativity, sustainability, and inclusivity at the heart of everything we do.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Team Section -->
            <div class="team">
                <div class="container my-5">
                    <h2 class="text-center mb-4" style="color: #b8354c;">Our Team</h2>
                    <div class="row g-4">
                        <div class="col-md-4 text-center">
                            <div class="team-photo">
                                <img src="assests/HomePage/download%20(4).jpg" alt="Team Member" class="img-fluid">
                                <h5 class="mt-2">Jane Doe</h5>
                                <p>Founder & Creative Director</p>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <div class="team-photo">
                                <img src="assests/HomePage/images%20(1).jpg" alt="Team Member" class="img-fluid">
                                <h5 class="mt-2">John Smith</h5>
                                <p>Head of Operations</p>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <div class="team-photo">
                                <img src="assests/HomePage/images%20(2).jpg" alt="Team Member" class="img-fluid">
                                <h5 class="mt-2">Emily Clark</h5>
                                <p>Lead Designer</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contact Section -->
            <div class="contact" id="Contact-Us">
            <div class="container my-5"> <h2 class="mb-4" style="color: #da6879;"  >Contact Us</h2>
                <div class="row g-4">
                    <!-- Contact Form -->
                    <div class="col-lg-6">
                        <div class="contact-form">
                            <h3 class="mb-4" style="color: #ff6bb4;">Send Us a Message</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Your Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="Enter your name">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Your Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter your email">
                                </div>
                                <div class="mb-3">
                                    <label for="message" class="form-label">Your Message</label>
                                    <textarea class="form-control" id="message" rows="5" placeholder="Type your message here"></textarea>
                                </div>
                                <button type="submit" class="btn btn-custom w-100">Send Message</button>
                            </form>
                        </div>
                    </div>

                    <!-- Contact Info -->
                    <div class="col-lg-6">
                        <div class="contact-info">
                            <h5>Contact Information</h5>
                            <p><strong>Address:</strong> 123 Fashion Street, Style City, SC 12345</p>
                            <p><strong>Phone:</strong> <a href="tel:+1234567890">+1 (234) 567-890</a></p>
                            <p><strong>Email:</strong> <a href="mailto:contact@lulusfashion.com">contact@lulusfashion.com</a></p>
                            <p><strong>Open Hours:</strong> Mon - Sun: 9 AM - 6 PM</p>
                            <div class="mt-4">
                                <h6>Follow Us:</h6>
                                <a href="#" style="color: white; margin-right: 15px;"></a>
                                <a href="#" style="color: white; margin-right: 15px;"></a>
                                <a href="#" style="color: white;"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

            <!-- Footer -->
            <footer>
                <p>&copy; 2025 Lulus Fashion. All rights reserved.</p>
            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
