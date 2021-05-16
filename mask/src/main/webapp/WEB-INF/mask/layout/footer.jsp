<%@ page language="java" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.footer-dark {
  padding:50px 0;
  color:#f0f9ff;
  background-color:#282d32;
}

.footer-dark h3 {
  margin-top:0;
  margin-bottom:12px;
  font-weight:bold;
  font-size:16px;
}

.footer-dark ul {
  padding:0;
  list-style:none;
  line-height:1.6;
  font-size:14px;
  margin-bottom:0;
}

.footer-dark ul a {
  color:inherit;
  text-decoration:none;
  opacity:0.6;
}

.footer-dark ul a:hover {
  opacity:0.8;
}

@media (max-width:767px) {
  .footer-dark .item:not(.social) {
    text-align:center;
    padding-bottom:20px;
  }
}

.footer-dark .item.text {
  margin-bottom:36px;
}

@media (max-width:767px) {
  .footer-dark .item.text {
    margin-bottom:0;
  }
}

.footer-dark .item.text p {
  opacity:0.6;
  margin-bottom:0;
}

.footer-dark .item.social {
  text-align:center;
}

@media (max-width:991px) {
  .footer-dark .item.social {
    text-align:center;
    margin-top:20px;
  }
}

.footer-dark .item.social > a {
  font-size:20px;
  width:36px;
  height:36px;
  line-height:36px;
  display:inline-block;
  text-align:center;
  border-radius:50%;
  box-shadow:0 0 0 1px rgba(255,255,255,0.4);
  margin:0 8px;
  color:#fff;
  opacity:0.75;
}

.footer-dark .item.social > a:hover {
  opacity:0.9;
}

.footer-dark .copyright {
  text-align:center;
  padding-top:24px;
  opacity:0.3;
  font-size:13px;
  margin-bottom:0;
}
</style>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./css/style.css">
    
    <style type="text/css">
    #footer {

    position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

	padding: 15px 0;

	text-align: center;

}
    </style>
</head>




<body>
    <div class="footer-dark" id="footer">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-md-2 item">
                        <h3>�Ǹ�</h3>
                        <ul>
                            <li><a href="#">����ũ</a></li>
                            <li><a href="#">�ռҵ���</a></li>
                            <li><a href="#">ü�°�</a></li>
                        </ul>
                    </div>
                      <div class="col-sm-4 col-md-2 item">
                        <h3>Ŀ�´�Ƽ</h3>
                        <ul>
                            <li><a href="#">Ŀ�´�Ƽ</a></li>
                            <li><a href="#">��������</a></li>
                            <li><a href="#">1:1����</a></li>
                            <li><a href="#">�����ı�</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-2 item">
                        <h3>������</h3>
                        <ul>
                            <li><a href="#">������ ��ȣ : 7777-7777</a></li>
                            <li><a href="#">�����ð� : AM09:00 ~ PM06:00 ���ɽð� : AM12:00 ~ PM01:00</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>����</h3>
                        <p>���� ����ũ

����Ư���� ���α� �̷����� 3�� 304ȣ<BR>

������ �ּ� : ���α� �̷����� 77, 304ȣ<BR>

��ȭ : 7777-7777 | �ѽ� : 02-7777-7777<BR>����Ǹž��Ű� : �� 2021-��������-0777ȣ | ����ڵ�Ϲ�ȣ : 777-77-7777</p>     </div>
       
       
       <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">���� ����ũ ��������: 2021-04-02</p>
            </div>
        </footer>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>