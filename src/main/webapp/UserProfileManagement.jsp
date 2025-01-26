<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
    }

    .container {
      max-width: 800px;
      margin-top: 50px;
    }

    .profile-card {
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 30px;
      border: 2px solid #ff69b4; /* Pink border */
    }

    .profile-card h3 {
      color: #ff69b4;
      font-weight: 700;
    }

    .form-label {
      color: #ff69b4;
    }

    .btn-pink {
      background-color: #ff69b4;
      color: white;
      border: none;
      border-radius: 25px;
      padding: 10px 30px;
      font-weight: 500;
      width: 100%;
      transition: background-color 0.3s;
    }

    .btn-pink:hover {
      background-color: #e05088;
    }

    .form-control {
      border-radius: 25px;
      border: 2px solid #ff69b4;
      box-shadow: none;
    }

    .form-control:focus {
      border-color: #ff69b4;
      box-shadow: 0 0 5px rgba(255, 105, 180, 0.5);
    }

    .section-title {
      color: #ff69b4;
      font-weight: 700;
      margin-bottom: 30px;
    }

    .password-section {
      background-color: #f9f2f4;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-top: 30px;
    }

    .password-section input {
      margin-bottom: 15px;
    }

    .btn-outline-pink {
      background-color: #ffdaea;
      color: #ff69b4;
      border: 2px solid #ff69b4;
      border-radius: 25px;
      width: 100%;
    }

    .btn-outline-pink:hover {
      background-color: #ff69b4;
      color: white;
    }
  </style>
</head>
<body>
<div class="container">
  <!-- Profile Card -->
  <div class="profile-card">
    <h3>Update Your Profile</h3>
    <form>
      <!-- Personal Information Section -->
      <div class="section-title">Personal Information</div>
      <div class="mb-3">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter your full name">
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email Address</label>
        <input type="email" class="form-control" id="email" placeholder="Enter your email">
      </div>
      <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number">
      </div>

      <button type="submit" class="btn btn-pink">Update Information</button>
    </form>
  </div>

  <!-- Password Update Section -->
  <div class="password-section mt-4">
    <div class="section-title">Change Password</div>
    <form>
      <div class="mb-3">
        <label for="current-password" class="form-label">Current Password</label>
        <input type="password" class="form-control" id="current-password" placeholder="Enter current password">
      </div>
      <div class="mb-3">
        <label for="new-password" class="form-label">New Password</label>
        <input type="password" class="form-control" id="new-password" placeholder="Enter new password">
      </div>
      <div class="mb-3">
        <label for="confirm-password" class="form-label">Confirm New Password</label>
        <input type="password" class="form-control" id="confirm-password" placeholder="Confirm new password">
      </div>

      <button type="submit" class="btn btn-outline-pink">Change Password</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
