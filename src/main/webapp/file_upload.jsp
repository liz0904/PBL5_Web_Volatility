<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>

<head>
    <link rel="stylesheet" href="style.css">
    <script>
    function DropFile(dropAreaId, fileListId) {
    	  let dropArea = document.getElementById(dropAreaId);
    	  let fileList = document.getElementById(fileListId);

    	  function preventDefaults(e) {
    	    e.preventDefault();
    	    e.stopPropagation();
    	  }

    	  function highlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.add("highlight");
    	  }

    	  function unhighlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.remove("highlight");
    	  }

    	  function handleDrop(e) {
    	    unhighlight(e);
    	    let dt = e.dataTransfer;
    	    let files = dt.files;

    	    handleFiles(files);

    	    const fileList = document.getElementById(fileListId);
    	    if (fileList) {
    	      fileList.scrollTo({ top: fileList.scrollHeight });
    	    }
    	  }

    	  function handleFiles(files) {
    	    files = [...files];
    	    // files.forEach(uploadFile);
    	    files.forEach(previewFile);
    	  }

    	  function previewFile(file) {
    	    console.log(file);
    	    renderFile(file);
    	  }

    	  function renderFile(file) {
    	    let reader = new FileReader();
    	    reader.readAsDataURL(file);
    	    reader.onloadend = function () {
    	      let img = dropArea.getElementsByClassName("preview")[0];
    	      img.src = reader.result;
    	      img.style.display = "block";
    	    };
    	  }

    	  dropArea.addEventListener("dragenter", highlight, false);
    	  dropArea.addEventListener("dragover", highlight, false);
    	  dropArea.addEventListener("dragleave", unhighlight, false);
    	  dropArea.addEventListener("drop", handleDrop, false);

    	  return {
    	    handleFiles
    	  };
    	}

    	const dropFile = new DropFile("drop-file", "files");
    </script>
</head>

<div id="root">
  <h2 class="title">File Upload</h2>
  <hr>
  <div class="contents">
    <div class="upload-box">
      <div id="drop-file" class="drag-file">
        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
        <p class="message">Drag files to upload</p>
        <img src="" alt="미리보기 이미지" class="preview">
      </div>
      <label class="file-label" for="chooseFile">Choose File</label>
      <input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
    </div>
  </div>
</div>
</body>
</html>

