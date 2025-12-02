<?php
session_start();
// Đảm bảo đường dẫn tới các file include là chính xác
include("../config/dbcon.php"); 
include("../functions/myfunctions.php"); 

// =========================================================================
// 1. XỬ LÝ ĐĂNG KÝ (register-btn) - Mật khẩu KHÔNG MÃ HÓA
// =========================================================================
if(isset($_POST['register-btn']))
{
    // Cắt bỏ khoảng trắng thừa ngay khi lấy dữ liệu
    $name       = mysqli_real_escape_string($conn, $_POST['name']);
    $phone      = mysqli_real_escape_string($conn, $_POST['phone']);
    $email      = mysqli_real_escape_string($conn, $_POST['email']);
    $password   = trim(mysqli_real_escape_string($conn, $_POST['password']));
    $cpassword  = trim(mysqli_real_escape_string($conn, $_POST['cpassword']));

    // Check email đã tồn tại
    $check_email_query = "SELECT email FROM users WHERE email='$email' ";
    $check_email_query_run = mysqli_query($conn, $check_email_query);

    if(mysqli_num_rows($check_email_query_run) > 0)
    {
        redirect("../register.php", "Email của bạn đã được sử dụng. Xin hãy sử dụng Email khác");
    }
    else
    {
        if($password == $cpassword)
        {
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                // ĐÃ SỬA: Mật khẩu được lưu dưới dạng văn bản thuần túy (Plain Text)
                $plain_password = $password; 
                
                $insert_query = "INSERT INTO `users` (`name`,`email`,`phone`,`password`) VALUES ('$name','$email','$phone','$plain_password')";
                $insert_query_run = mysqli_query($conn, $insert_query);
                
                if($insert_query_run){
                    redirect("../login.php", "Đăng ký tài khoản thành công");
                }else{
                    redirect("../register.php", "Đã xảy ra lỗi");
                }
            }else{
                redirect("../register.php", "Địa chỉ email không hợp lệ");
            }
        }else{
            redirect("../register.php", "Mật khẩu không khớp");
        }
    } 
}
// =========================================================================
// 2. XỬ LÝ ĐĂNG NHẬP (login_btn) - So sánh chuỗi Plain Text
// =========================================================================
else if(isset($_POST['login_btn']))
{
    $email      = mysqli_real_escape_string($conn, $_POST['email']);
    $password   = trim(mysqli_real_escape_string($conn, $_POST['password'])); 
    
    $login_query = "SELECT * FROM `users` WHERE `email`='$email'";
    $login_query_run = mysqli_query($conn, $login_query);

    if(mysqli_num_rows($login_query_run) > 0)
    {
        $userdata       = mysqli_fetch_array($login_query_run);
        // Cắt khoảng trắng của mật khẩu từ DB (phòng trường hợp lỗi input)
        $db_password    = trim($userdata['password']); 

        // ĐÃ SỬA: So sánh chuỗi mật khẩu Plain Text trực tiếp
        if($password === $db_password) 
        {
            $_SESSION['auth'] = true;

            $userid     = $userdata['id'];
            $username   = $userdata['name'];
            $useremail  = $userdata['email'];
            $role_as    = $userdata['role_as'];
            
            $_SESSION['auth_user'] = [
                'id'    => $userid,
                'name'  => $username,
                'email' => $useremail
            ];
            
            $_SESSION['role_as'] = $role_as;
            
            if($role_as == 1)
            { 
                redirect("../admin/index.php", "Welcome to ADMIN ");
            }else
            {
                redirect("../index.php", "Đăng nhập thành công");
            }
        }
        else
        {
            redirect("../login.php", "Mật khẩu không đúng"); 
        }
    }else
    {
        redirect("../login.php", "Tài khoản email không tồn tại");
    }
}
// =========================================================================
// 3. XỬ LÝ CẬP NHẬT (update_user_btn) - Mật khẩu KHÔNG MÃ HÓA
// =========================================================================
else if(isset($_POST['update_user_btn']))
{
    $id = $_SESSION['auth_user']['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $password = $_POST['password']; 
    $cpassword = $_POST['cpassword'];
    
    // Nếu người dùng không nhập mật khẩu mới
    if(empty($password))
    {
        $update_query = "UPDATE `users` SET `name`='$name', `email`='$email', `phone`='$phone', `address`='$address' WHERE `id`='$id' ";
        $update_query_run = mysqli_query($conn, $update_query);
        
        if($update_query_run)
        {
            redirect("../user-profile.php","Cập nhật thông tin thành công");
        }
        else
        {
            redirect("../user-profile.php","Xảy ra lỗi, vui lòng cập nhật lại");
        }
    }
    // Nếu người dùng có nhập mật khẩu mới
    else
    {
        if($password == $cpassword)
        {
            // ĐÃ SỬA: Mật khẩu được lưu dưới dạng văn bản thuần túy (Plain Text)
            $plain_password = $password; 
            
            $update_query = "UPDATE `users` SET `name`='$name', `email`='$email', `phone`='$phone', `address`='$address', `password`='$plain_password' WHERE `id`='$id' ";
            $update_query_run = mysqli_query($conn, $update_query);
            
            if($update_query_run)
            {
                redirect("../user-profile.php","Cập nhật thông tin thành công");
            }
            else
            {
                redirect("../user-profile.php","Xảy ra lỗi, vui lòng cập nhật lại");
            }
        }else
        {
            redirect("../user-profile.php","Mật khẩu không khớp, vui lòng nhập lại");
        }
    }
}
?>