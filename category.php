<?php
session_start();
error_reporting(0);
include('includes/config.php');
$cid = intval($_GET['cid']);
if (isset($_GET['action']) && $_GET['action'] == "add") {
	$id = intval($_GET['id']);
	if (isset($_SESSION['cart'][$id])) {
		$_SESSION['cart'][$id]['quantity']++;
	} else {
		$sql_p = "SELECT * FROM products WHERE id={$id}";
		$query_p = mysqli_query($con, $sql_p);
		if (mysqli_num_rows($query_p) != 0) {
			$row_p = mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productPrice']);
			echo "<script>alert('Produk berhasil masuk kedalam keranjang.')</script>";
			echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
		} else {
			$message = "Product ID is invalid";
		}
	}
}
// COde for Wishlist
if (isset($_GET['pid']) && $_GET['action'] == "wishlist") {
	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {
		mysqli_query($con, "insert into wishlist(userId,productId) values('" . $_SESSION['id'] . "','" . $_GET['pid'] . "')");
		echo "<script>alert('Product aaded in wishlist');</script>";
		header('location:my-wishlist.php');
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Meta -->
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="eCommerce,Rakitpc">
	<meta name="robots" content="all">

	<title>Kategori Produk</title>

	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<!-- Customizable CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.transitions.css">
	<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

	<link rel="stylesheet" href="assets/css/config.css">
	<!-- Icons/Glyphs -->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">


</head>

<body class="cnt-home">
	<header class="header-style-1">
		<?php include('includes/top-header.php'); ?>
		<?php include('includes/main-header.php'); ?>
	</header>
	</div>
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row outer-bottom-sm'>
				<div class="col-md-3 sidebar">
					<?php include('includes/side-menu.php'); ?>
				</div>
				<div class='col-md-9'>
					<div id="category" class="category-carousel hidden-xs">
						<?php $sql = mysqli_query($con, "select categoryName  from category where id='$cid'");
						while ($row = mysqli_fetch_array($sql)) {
						?>
							<div class="excerpt hidden-sm hidden-md">
								<?php echo htmlentities($row['categoryName']); ?>
							</div>
						<?php } ?>
					</div>
					<div class="search-result-container">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active " id="grid-container">
								<div class="category-product">
									<div class="row">
										<?php
										$ret = mysqli_query($con, "select * from products where category='$cid'");
										$num = mysqli_num_rows($ret);
										if ($num > 0) {
											while ($row = mysqli_fetch_array($ret)) { ?>
												<div class="col-sm-6 col-md-12 wow fadeInUp">
													<hr>
													<div class="products">
														<div class="product">
															<div class="col-md-2">
																<div class="product-image">
																	<div class="image">
																		<a href="https://google.com/search?q=<?php echo htmlentities($row['productName']) ?>" target="_blank"><img src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" alt="" width="80" height="80"></a>
																	</div><!-- /.image -->
																</div><!-- /.product-image -->
															</div>

															<div class="col-md-8 product-info text-left">
																<h3 class="name">
																	<a href="https://google.com/search?q=<?php echo htmlentities($row['productName']) ?>" target="_blank"><?php echo htmlentities($row['productName']); ?></a>
																</h3>
																<div class="product-price">
																	<span class="price">
																		Rp. <?php echo number_format($row['productPrice']); ?> </span>
																</div><!-- /.product-price -->

															</div><!-- /.product-info -->
															<div class="cart clearfix animate-effect">
																<div class="action">
																	<ul class="list-unstyled">
																		<li class="add-cart-button btn-group">

																			<?php if ($row['productAvailability'] == 'In Stock') { ?>
																				<a href="category.php?page=product&action=add&id=<?php echo $row['id']; ?>">
																					<button class="btn btn-primary" type="button"><i class="icon fa fa-shopping-cart"></i></button></a>
																			<?php } else { ?>
																				<div class="action" style="color:red">Out of Stock</div>
																			<?php } ?>

																		</li>

																		<li class="lnk wishlist">
																			<a class="add-to-cart" href="category.php?pid=<?php echo htmlentities($row['id']) ?>&&action=wishlist" title="Wishlist">
																				<i class="icon fa fa-heart"></i>
																			</a>
																		</li>
																	</ul>
																</div><!-- /.action -->
															</div><!-- /.cart -->
														</div>
													</div>
												</div>
											<?php }
										} else { ?>

											<div class="col-sm-6 col-md-4 wow fadeInUp">
												<h3>Tidak ada Produk</h3>
											</div>

										<?php } ?>










									</div><!-- /.row -->
								</div><!-- /.category-product -->

							</div><!-- /.tab-pane -->



						</div><!-- /.search-result-container -->

					</div><!-- /.col -->
				</div>
			</div>

		</div>
	</div>
	<?php include('includes/footer.php'); ?>
	<script src="assets/js/jquery-1.11.1.min.js"></script>

	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>

	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
	<script src="assets/js/bootstrap-select.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>


</body>

</html>