<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
</head>
<body>
<!-- Main Content -->
			<div class="main-content">
				<div class="col-12 col-md-12 col-lg-5" style="background-color:White;border-radius:10px;">
					<form action="userInsertActivity.controller" method="post"
						enctype="multipart/form-data">
						<div class="st1">
							<div class="">
								<img id="output" src="images\partyPic\party1.jpg" alt=""
									style="width: 600px; height: 450px; border-radius:10px; margin:10px"><br>

							</div>
							<div>
								<label class="form-label" for="">�ʭ��Ӥ�</label><span id="sp_cover"></span>
								<input name="cover" class="form-control" type="file" id="cover"
									multiple onchange="lovdFile(event)">

							</div>
							<div>
								<input type="hidden" name="anum" size="20"
									placeholder="�п�J����ID..." value="${party.number}" /> <label
									for="">���ʦW��: </label> <input type="text" name="Activityname">
							</div>


							<div>
								<select name="type" class="form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option selected>��������</option>
									<option value="���|">���|</option>
									<option value="�ȹC">�ȹC</option>
									<option value="���">���</option>
									<option value="����">����</option>
									<option value="�T��">�T��</option>
									<option value="�Ч@">�Ч@</option>
									<option value="���|">���|�A��</option>
									<option value="�}�i">����}�i</option>
								</select>
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">���ʤ��:</label> <input type="date"
									name="time" id="time">
							</div>
							<div>
								<!-- yyyy-mm-dd  -->
								<label class="" for="">�I����:</label> <input
									type="datetime-local" name="time_up" id="time_up">
							</div>

							<div>
								<label for="comment1" class="">���ʤ��e:</label>
								<textarea name="Detail" id="plan" cols="40" rows="5" value="" style=" resize: none;"></textarea>
							</div>

							<div>
								<!-- ���� �ϰ� �� ����a�} -->
								<label for="">���ʦa�I:</label> <span id="twzipcode"></span><input
									type="text" name="place">
							</div>

							<div>
								<label>�ѥ[����</label> <input type="text" name="condition">
								<br> <label for="">�k�ͤH��:</label> <input type="number"
									name="man" id="numberInput" min="0" max="12" step="1"
									onchange="numberChange()"> <label for=""> �k�ͤH��:</label>
								<input type="number" name="woman" id="numberInput" min="0"
									max="12" step="1" onchange="numberChange()">
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-sm">�Ыج���</button>
								<button type="reset" class="btn btn-secondary btn-sm" style="margin-right:100px">�M�����</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- main content -->
			
			<script>
			// �Ӥ����
			var lovdFile = function(event) {
				var output = document.getElementById('output');
				output.src = URL.createObjectURL(event.target.files[0]);
				output.onload = function() {
					URL.revokeObjectURL(output.src)
				}
			}
			// �Ӥ����P�w
			document.getElementById("cover").addEventListener("blur",
					checkcover);

			function checkcover() {
				let cover = document.getElementById("cover");
				let coverVal = cover.value;
				let sp_cover = document.getElementById("sp_cover");
				let coverCheck = /\.jpg$/;
				if (coverVal == "")
					sp_cover.innerHTML = "�ФW�ǷӤ�";
				else if (coverCheck.test(coverVal) == false)
					sp_cover.innerHTML = "�Ȥ䴩 .jpg �ɮ�"
				else
					sp_cover.innerHTML = "���\"
			}
			// ����
			$("#twzipcode").twzipcode({
				zipcodeIntoDistrict : true,
			});

			$("#twzipcode").twzipcode("set", {
				county : "${userActivity.county}",
				district : "${userActivity.district}",
			});
		</script>
</body>
</html>