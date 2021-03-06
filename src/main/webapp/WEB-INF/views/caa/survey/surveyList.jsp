<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
   name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
   type="image/x-icon" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
   width: 250px;
   padding-bottom: 20px;
}
</style>
<script>
   WebFont.load({
      google : {
         "families" : [ "Lato:300,400,700,900" ]
      },
      custom : {
         "families" : [ "Flaticon", "Font Awesome 5 Solid",
               "Font Awesome 5 Regular", "Font Awesome 5 Brands",
               "simple-line-icons" ],
         urls : [ '/resources/assets/css/fonts.min.css' ]
      },
      active : function() {
         sessionStorage.fonts = true;
      }
   });

   function sendEmail() {

   };
</script>

<!-- CSS Files -->
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->
</head>
<body>
   <div class="wrapper fullheight-side sidebar_minimize">

      <div class="main-panel full-height">
         <div class="container">
            <div class="panel-header">
               <div class="page-inner border-bottom pb-0 mb-3">
                  <div class="d-flex align-items-left flex-column">
                     <h2 class="pb-2 fw-bold">설문조사</h2>

                  </div>
                  <!-- <img alt="" src="/resources/assets/img/thinkpeopleLogo.png"
                     style="width: 200px"> <img alt=""
                     src="/resources/assets/img/business.png" style="width: 100%"> -->
               </div>
            </div>
            <div class="page-inner">
               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <div id="basic-datatables_wrapper"
                              class="dataTables_wrapper container-fluid dt-bootstrap4">
                              <div class="row">
                                 <div class="col-sm-12">
                                    <table id="basic-datatables"
                                       class="display table table-striped table-hover dataTable"
                                       role="grid" aria-describedby="basic-datatables_info">
                                       <thead>
                                          <tr role="row">
                                             <th class="sorting_asc" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 76px;">번호</th>
                                             <th class="sorting" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 96px;">설문제목</th>
                                             <th class="sorting" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-label="Office: activate to sort column ascending"
                                                style="width: 70px;">기간</th>
                                             <th class="sorting" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-label="Age: activate to sort column ascending"
                                                style="width: 27px;">작성일</th>
                                             <th class="sorting" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-label="Start date: activate to sort column ascending"
                                                style="width: 83px;">완료여부</th>
                                             <!-- <th class="sorting" tabindex="0"
                                                aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                aria-label="Salary: activate to sort column ascending"
                                                style="width: 78px;">Salary</th> -->
                                          </tr>
                                       </thead>
                                       <tfoot>
                                          <tr>
                                             <th rowspan="1" colspan="1">Name</th>
                                             <th rowspan="1" colspan="1">Position</th>
                                             <th rowspan="1" colspan="1">Office</th>
                                             <th rowspan="1" colspan="1">Age</th>
                                             <th rowspan="1" colspan="1">Start date</th>
                                             <!-- <th rowspan="1" colspan="1">Salary</th> -->
                                          </tr>
                                       </tfoot>
                                       <tbody>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                          <tr role="row" class="odd">
                                             <td class="sorting_1">Airi Satou</td>
                                             <td>Accountant</td>
                                             <td>Tokyo</td>
                                             <td>33</td>
                                             <td>2008/11/28</td>
                                             <!-- <td>$162,700</td> -->
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-sm-12 col-md-5">
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>

      </div>

   </div>
   <!--   Core JS Files   -->
   <script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
   <script src="/resources/assets/js/core/popper.min.js"></script>
   <script src="/resources/assets/js/core/bootstrap.min.js"></script>
   <!-- jQuery UI -->
   <script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
   <script src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
   <!-- Bootstrap Toggle -->
   <script src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
   <!-- jQuery Scrollbar -->
   <script src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
   <!-- Datatables -->
   <script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
   <!-- Atlantis JS -->
   <script src="/resources/assets/js/atlantis.min.js"></script>

   <script >
      $(document).ready(function() {
         $('#basic-datatables').DataTable({
         });

         $('#multi-filter-select').DataTable( {
            "pageLength": 5,
            initComplete: function () {
               this.api().columns().every( function () {
                  var column = this;
                  var select = $('<select class="form-control"><option value=""></option></select>')
                  .appendTo( $(column.footer()).empty() )
                  .on( 'change', function () {
                     var val = $.fn.dataTable.util.escapeRegex(
                        $(this).val()
                        );

                     column
                     .search( val ? '^'+val+'$' : '', true, false )
                     .draw();
                  } );

                  column.data().unique().sort().each( function ( d, j ) {
                     select.append( '<option value="'+d+'">'+d+'</option>' )
                  } );
               } );
            }
         });

      });
   </script>
</body>
</html>