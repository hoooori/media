// ***************************
//        EventListener
// ***************************
document.addEventListener('DOMContentLoaded', e => {
  const photoUploadModal = document.querySelector('#photoUploadModal');

  if(photoUploadModal) {
    photoUploadModal.addEventListener('DOMActivate', e => {
      // photoUploadModalが非表示になる際のイベント
      if(photoUploadModal.classList.contains('show')) { return; }
      document.querySelector('#photoUploadNotice').innerHTML = ''; // モーダルのflashメッセージ削除
      document.querySelector('#photo_contents').value = ''; // モーダルのファイルフィールドを空にする
    });
  }
});
