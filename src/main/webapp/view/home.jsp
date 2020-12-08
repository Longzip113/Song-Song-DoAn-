<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quicksort - Multithread</title>

<!-- Bootstrap core CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<style>
.pagination li:hover {
	cursor: pointer;
}

#wrapper {
	overflow-x: hidden;
}

#sidebar-wrapper {
	min-height: 100vh;
	margin-left: -15rem;
	-webkit-transition: margin .25s ease-out;
	-moz-transition: margin .25s ease-out;
	-o-transition: margin .25s ease-out;
	transition: margin .25s ease-out;
}

#sidebar-wrapper .sidebar-heading {
	padding: 0.875rem 1.25rem;
	font-size: 1.2rem;
}

#sidebar-wrapper .list-group {
	width: 15rem;
}

#page-content-wrapper {
	min-width: 100vw;
}

#wrapper.toggled #sidebar-wrapper {
	margin-left: 0;
}

@media ( min-width : 768px) {
	#sidebar-wrapper {
		margin-left: 0;
	}
	#page-content-wrapper {
		min-width: 0;
		width: 100%;
	}
	#wrapper.toggled #sidebar-wrapper {
		margin-left: -15rem;
	}
}

.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.pagination>li {
	display: inline;
}

.pagination>li>a, .pagination>li>span {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

.pagination>li:first-child>a, .pagination>li:first-child>span {
	margin-left: 0;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.pagination>li:last-child>a, .pagination>li:last-child>span {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.pagination>li>a:hover, .pagination>li>span:hover, .pagination>li>a:focus,
	.pagination>li>span:focus {
	z-index: 2;
	color: #23527c;
	background-color: #eee;
	border-color: #ddd;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #337ab7;
	border-color: #337ab7;
}

.pagination>.disabled>span, .pagination>.disabled>span:hover,
	.pagination>.disabled>span:focus, .pagination>.disabled>a, .pagination>.disabled>a:hover,
	.pagination>.disabled>a:focus {
	color: #777;
	cursor: not-allowed;
	background-color: #fff;
	border-color: #ddd;
}

.paginationn li:hover {
	cursor: pointer;
}

.paginationn {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.paginationn>li {
	display: inline;
}

.paginationn>li>a, .paginationn>li>span {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

.paginationn>li:first-child>a, .paginationn>li:first-child>span {
	margin-left: 0;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.paginationn>li:last-child>a, .paginationn>li:last-child>span {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.paginationn>li>a:hover, .pagination>li>span:hover, .paginationn>li>a:focus,
	.paginationn>li>span:focus {
	z-index: 2;
	color: #23527c;
	background-color: #eee;
	border-color: #ddd;
}

.paginationn>.active>a, .paginationn>.active>span, .paginationn>.active>a:hover,
	.paginationn>.active>span:hover, .paginationn>.active>a:focus,
	.paginationn>.active>span:focus {
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #337ab7;
	border-color: #337ab7;
}

.paginationn>.disabled>span, .paginationn>.disabled>span:hover,
	.paginationn>.disabled>span:focus, .paginationn>.disabled>a,
	.paginationn>.disabled>a:hover, .paginationn>.disabled>a:focus {
	color: #777;
	cursor: not-allowed;
	background-color: #fff;
	border-color: #ddd;
}

.pagination-lg>li>a, .pagination-lg>li>span {
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.3333333;
}

.pagination-lg>li:first-child>a, .pagination-lg>li:first-child>span {
	border-top-left-radius: 6px;
	border-bottom-left-radius: 6px;
}

.pagination-lg>li:last-child>a, .pagination-lg>li:last-child>span {
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
}

.pagination-sm>li>a, .pagination-sm>li>span {
	padding: 5px 10px;
	font-size: 12px;
	line-height: 1.5;
}

.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

.pagination-sm>li:last-child>a, .pagination-sm>li:last-child>span {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

/* bonus for nav */
.grad {
	background-image: radial-gradient(circle, violet, pink, orange);
}
/* bonus for content */
.content-background {
	background-image: url("../img/background.jpg");
	background-size: 50%;
}
</style>
</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-info text-white border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Trang chủ</div>
			<div class="list-group list-group-flush">
				<a href="./web-home?action=load"
					class="list-group-item list-group-item-action bg-info text-white">Chạy
					thuật toán</a> <a href="./web-member"
					class="list-group-item list-group-item-action bg-info text-white">Thành
					viên</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper" class="content-background">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom grad">
				<button class="btn btn-primary" id="menu-toggle">Menu</button>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
			<div class="container">
				<div class="text-center">
					<h1 class="text-danger">Quicksort - Multithread</h1>
				</div>

				<form action="<c:url value='/run'/>"  method="GET">
					<div>
						<h4>Nhập số phần tử mà bạn muốn thêm</h4>
						<input type="submit" class="btn btn-primary" value="Lấy dữ liệu" />
					</div>
					<input type="hidden" value="random" name="action"> <input
						name="number" type="number" class="form-control" placeholder="...">
				</form>
				<form action="<c:url value='/run'/>"  method="POST">
					<div class="row">
						<div class="col-6">
							<div class="card" style="min-height: 300px;">
								<div class="card-header text-center">
									<h3>Tuần tự</h3>
									<input type="hidden" value="single" name="styleSort">
								</div>
								<div class="card-body">
									<div style="min-height: 100px;"></div>
									<div style="min-height: 100px;">
										<h4>Sắp xếp theo</h4>
										<div class="form-check">
											<div class="row">
												<div class="col-6">
													<input class="form-check-input" type="radio"
														name="selectSort" value="people"> <label
														class="form-check-label"> Tên người mượn </label>
												</div>
												<div class="col-6">
													<input class="form-check-input" type="radio"
														name="selectSort" value="nameBook"> <label
														class="form-check-label"> Tên sách </label>
												</div>
											</div>
										</div>
									</div>
									<input type="text" class="form-control" placeholder="Kết quả"
										value="${timeSingle}" disabled>
								</div>
								<input type="submit" class="btn btn-primary"
									value="Chạy
										thuật toán" id="btnRunThuatToan" />
				</form>
			</div>
			<div>
				<h3>Bảng phần tử</h3>
				<div class="form-group">
					<!--		Show Numbers Of Rows 		-->
					<select class="form-control" name="state" id="maxRows">
						<option value="1000000">Show ALL Rows</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="70">70</option>
						<option value="100">100</option>
					</select>

				</div>
				<table class="table table-hover table-striped table-dark id"
					id="table-id">
					<thead>
						<tr>
							<th scope="col">Tên người mượn</th>
							<th scope="col">Tên sách</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${modelSingle.listResult}">
							<tr>
								<td>${item.tenNguoiMuon}</td>
								<td>${item.tenSach}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--		Start Pagination -->
				<div class='pagination-container'>
					<nav>
						<ul class="pagination">
							<li data-page="prev"><span> < <span class="sr-only">(current)
								</span></span></li>

							<li data-page="next" id="prev"><span> > <span
									class="sr-only">(current)</span></span></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="col-6">
			<form action="<c:url value='/run'/>" id="formSubmit" method="POST">
				<div class="card" style="min-height: 300px;">
					<div class="card-header text-center">
						<h3>Song song</h3>
						<input type="hidden" value="threads" name="styleSort">
					</div>
					<div class="card-body">
						<div style="min-height: 100px;">
							<h4>Chọn số luồng</h4>
							<div class="form-check">
								<div class="row">
									<div class="col-4">
										<input type="text" class="form-control" name="numberThread"
											placeholder="Số luồng ..">
									</div>
								</div>
							</div>
						</div>
						<div style="min-height: 100px;">
							<h4>Sắp xếp theo</h4>
							<div class="form-check">
								<div class="row">
									<div class="col-6">
										<input class="form-check-input" type="radio" name="selectSort"
											value="people"> <label class="form-check-label">
											Tên người mượn </label>
									</div>
									<div class="col-6">
										<input class="form-check-input" type="radio" name="selectSort"
											value="nameBook"> <label class="form-check-label">
											Tên sách </label>
									</div>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="Kết quả"
							value="${timeThreads}" disabled>
					</div>
					<input type="submit" class="btn btn-primary"
						value="Chạy thuật toán" />
				</div>
			</form>
			<div>
				<h3>Bảng phần tử</h3>
				<div class="form-group">
					<!--		Show Numbers Of Rows 		-->
					<select class="form-control" name="state" id="maxRowss">
						<option value="1000000">Show ALL Rows</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="70">70</option>
						<option value="100">100</option>
					</select>

				</div>
				<table class="table table-hover table-striped  table-dark id2"
					id="table-id2">
					<thead>
						<tr>
							<th scope="col">Tên người mượn</th>
							<th scope="col">Tên sách</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${modelThreads.listResult}">
							<tr>
								<td>${item.tenNguoiMuon}</td>
								<td>${item.tenSach}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!--		Start Pagination -->
				<div class='pagination-container'>
					<nav>
						<ul class="paginationn">
							<li data-page="prev"><span> < <span class="sr-only">(current)
								</span></span></li>

							<li data-page="next" id="prevv"><span> > <span
									class="sr-only">(current)</span></span></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<div class="text-center">
		<form action="<c:url value='/search'/>"  method="GET">
			<div>
				<h4>Nhập tên người mượn</h4>
				<input type="submit" class="btn btn-primary" value="Tìm kiếm" />
			</div>
			<input type="hidden" value="search" name="action"> <input
				name="namePeople" class="form-control" >
		</form>
		<h1>Bảng kết quả tìm kiếm</h1>
	</div>
	<table class="table table-hover table-striped  table-dark">
		<thead>
			<tr>
				<th scope="col">Tên người mượn</th>
				<th scope="col">Tên sách</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${ketqua}">
				<tr>
					<td>${item.tenNguoiMuon}</td>
					<td>${item.tenSach}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/js.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		getPagination('#table-id');
		getPaginationn('#table-id2');
		//getPagination('.table-class');
		//getPagination('table');
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-36251023-1']);
		_gaq.push(['_setDomainName', 'jqueryscript.net']);
		_gaq.push(['_trackPageview']);

		(function () {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
		
		
		
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});			
			
			function getPagination(table) {
			  var lastPage = 1;

			  $('#maxRows')
			    .on('change', function(evt) {
			      //$('.paginationprev').html('');						// reset pagination

			      lastPage = 1;
			      $('.pagination')
			        .find('li')
			        .slice(1, -1)
			        .remove();
			      var trnum = 0; // reset tr counter
			      var maxRows = parseInt($(this).val()); // get Max Rows from select option

			      if (maxRows == 5000) {
			        $('.pagination').hide();
			      } else {
			        $('.pagination').show();
			      }

			      var totalRows = $(table + ' tbody tr').length; // numbers of rows
			      $(table + ' tr:gt(0)').each(function() {
			        // each TR in  table and not the header
			        trnum++; // Start Counter
			        if (trnum > maxRows) {
			          // if tr number gt maxRows

			          $(this).hide(); // fade it out
			        }
			        if (trnum <= maxRows) {
			          $(this).show();
			        } // else fade in Important in case if it ..
			      }); //  was fade out to fade it in
			      if (totalRows > maxRows) {
			        // if tr total rows gt max rows option
			        var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
			        //	numbers of pages
			        for (var i = 1; i <= pagenum; ) {
			          // for each page append pagination li
			          $('.pagination #prev')
			            .before(
			              '<li data-page="' +
			                i +
			                '">\
											  <span>' +
			                i++ +
			                '<span class="sr-only">(current)</span></span>\
											</li>'
			            )
			            .show();
			        } // end for i
			      } // end if row count > max rows
			      $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
			      $('.pagination li').on('click', function(evt) {
			        // on click each page
			        evt.stopImmediatePropagation();
			        evt.preventDefault();
			        var pageNum = $(this).attr('data-page'); // get it's number

			        var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

			        if (pageNum == 'prev') {
			          if (lastPage == 1) {
			            return;
			          }
			          pageNum = --lastPage;
			        }
			        if (pageNum == 'next') {
			          if (lastPage == $('.pagination li').length - 2) {
			            return;
			          }
			          pageNum = ++lastPage;
			        }

			        lastPage = pageNum;
			        var trIndex = 0; // reset tr counter
			        $('.pagination li').removeClass('active'); // remove active class from all li
			        $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
			        // $(this).addClass('active');					// add active class to the clicked
			        limitPagging();
			        $(table + ' tr:gt(0)').each(function() {
			          // each tr in table not the header
			          trIndex++; // tr index counter
			          // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
			          if (
			            trIndex > maxRows * pageNum ||
			            trIndex <= maxRows * pageNum - maxRows
			          ) {
			            $(this).hide();
			          } else {
			            $(this).show();
			          } //else fade in
			        }); // end of for each tr in table
			      }); // end of on click pagination list
			      limitPagging();
			    })
			    .val(5)
			    .change();

			  // end of on select change

			  // END OF PAGINATION
			}

			function limitPagging() {
			  // alert($('.pagination li').length)

			  if ($('.pagination li').length > 7) {
			    if ($('.pagination li.active').attr('data-page') <= 3) {
			      $('.pagination li:gt(5)').hide();
			      $('.pagination li:lt(5)').show();
			      $('.pagination [data-page="next"]').show();
			    }
			    if ($('.pagination li.active').attr('data-page') > 3) {
			      $('.pagination li:gt(0)').hide();
			      $('.pagination [data-page="next"]').show();
			      for (
			        let i = parseInt($('.pagination li.active').attr('data-page')) - 2;
			        i <= parseInt($('.pagination li.active').attr('data-page')) + 2;
			        i++
			      ) {
			        $('.pagination [data-page="' + i + '"]').show();
			      }
			    }
			  }
			}

 			$(function() {
			  // Just to append id number for each row
			  $('.id tr:eq(0)').prepend('<th> ID </th>');

			  var id = 0;

			  $('.id tr:gt(0)').each(function() {
			    id++;
			    $(this).prepend('<td>' + id + '</td>');
			  });
			});
 			
 			$(function() {
 				  // Just to append id number for each row
 				  $('.id2 tr:eq(0)').prepend('<th> ID </th>');

 				  var id = 0;

 				  $('.id2 tr:gt(0)').each(function() {
 				    id++;
 				    $(this).prepend('<td>' + id + '</td>');
 				  });
 				});
 			
 			
 			//lan 2
 			
 			function getPaginationn(table) {
  var lastPage = 1;

  $('#maxRowss')
    .on('change', function(evt) {
      //$('.paginationprev').html('');						// reset pagination

      lastPage = 1;
      $('.paginationn')
        .find('li')
        .slice(1, -1)
        .remove();
      var trnum = 0; // reset tr counter
      var maxRows = parseInt($(this).val()); // get Max Rows from select option

      if (maxRows == 5000) {
        $('.paginationn').hide();
      } else {
        $('.paginationn').show();
      }

      var totalRows = $(table + ' tbody tr').length; // numbers of rows
      $(table + ' tr:gt(0)').each(function() {
        // each TR in  table and not the header
        trnum++; // Start Counter
        if (trnum > maxRows) {
          // if tr number gt maxRows

          $(this).hide(); // fade it out
        }
        if (trnum <= maxRows) {
          $(this).show();
        } // else fade in Important in case if it ..
      }); //  was fade out to fade it in
      if (totalRows > maxRows) {
        // if tr total rows gt max rows option
        var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
        //	numbers of pages
        for (var i = 1; i <= pagenum; ) {
          // for each page append pagination li
          $('.paginationn #prevv')
            .before(
              '<li data-page="' +
                i +
                '">\
								  <span>' +
                i++ +
                '<span class="sr-only">(current)</span></span>\
								</li>'
            )
            .show();
        } // end for i
      } // end if row count > max rows
      $('.paginationn [data-page="1"]').addClass('active'); // add active class to the first li
      $('.paginationn li').on('click', function(evt) {
        // on click each page
        evt.stopImmediatePropagation();
        evt.preventDefault();
        var pageNum = $(this).attr('data-page'); // get it's number

        var maxRows = parseInt($('#maxRowss').val()); // get Max Rows from select option

        if (pageNum == 'prev') {
          if (lastPage == 1) {
            return;
          }
          pageNum = --lastPage;
        }
        if (pageNum == 'next') {
          if (lastPage == $('.paginationn li').length - 2) {
            return;
          }
          pageNum = ++lastPage;
        }

        lastPage = pageNum;
        var trIndex = 0; // reset tr counter
        $('.paginationn li').removeClass('active'); // remove active class from all li
        $('.paginationn [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
        // $(this).addClass('active');					// add active class to the clicked
        limitPagging();
        $(table + ' tr:gt(0)').each(function() {
          // each tr in table not the header
          trIndex++; // tr index counter
          // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
          if (
            trIndex > maxRows * pageNum ||
            trIndex <= maxRows * pageNum - maxRows
          ) {
            $(this).hide();
          } else {
            $(this).show();
          } //else fade in
        }); // end of for each tr in table
      }); // end of on click pagination list
      limitPaggingg();
    })
    .val(5)
    .change();

  // end of on select change

  // END OF PAGINATION
}
 			
 			function limitPaggingg() {
 				  // alert($('.pagination li').length)

 				  if ($('.paginationn li').length > 7) {
 				    if ($('.paginationn li.active').attr('data-page') <= 3) {
 				      $('.paginationn li:gt(5)').hide();
 				      $('.paginationn li:lt(5)').show();
 				      $('.paginationn [data-page="next"]').show();
 				    }
 				    if ($('.paginationn li.active').attr('data-page') > 3) {
 				      $('.paginationn li:gt(0)').hide();
 				      $('.paginationn [data-page="next"]').show();
 				      for (
 				        let i = parseInt($('.paginationn li.active').attr('data-page')) - 2;
 				        i <= parseInt($('.paginationn li.active').attr('data-page')) + 2;
 				        i++
 				      ) {
 				        $('.paginationn [data-page="' + i + '"]').show();
 				      }
 				    }
 				  }
 				}
		</script>
</body>
</html>