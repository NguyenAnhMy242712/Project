<footer class="bg-second">
        <div class="container">
            <div class="row center">
                <!-- <div class="col-5 col-md-6 ">
                    <h3 class="footer-head">Đồ Án Chuyên Ngành CNTT</h3>
                    <ul class="menu">
                        <li><a href="#">Sinh viên thực hiện: Nguyễn Thị Quỳnh</a></li>
                        <li><a href="#">Lớp: CNTT</a></li>
                        <li><a href="#">MSV: 0000000000</a></li>
                    </ul>
                </div> -->

                <!-- <div class="col-5 col-md-6">
                    <h3 class="footer-head">Đại học.........</h3>
                    <ul class="menu">
                        <li><a href="#"> Điện thoại: 0123456789</a></li>
                        <li><a href="#">Email: example@gmail.com</a></li>
                        <li><a href="#">Địa chỉ: 123 HN</a></li>
                    </ul>
                </div> -->
                <div class="col-2 col-md-6 col-sm-12">
                    <div class="contact">
                        <h3 class="contact-header">
                            Q_FASHION
                        </h3>
                        <ul class="contact-socials">
                            <li><a href="#">
                                    <i class='bx bxl-facebook-circle'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-instagram-alt'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-youtube'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-twitter'></i>
                                </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</footer>
<!-- app js -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
  <?php if(isset($_SESSION['message']))
  {
  ?>
    alertify.set('notifier','position', 'top-right');
    alertify.success('<?= $_SESSION['message'] ?>');
  <?php 
    unset($_SESSION['message']);
  }
  ?>
</script>
