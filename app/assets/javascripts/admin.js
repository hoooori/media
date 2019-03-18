// ***************************
//        EventListener
// ***************************
document.addEventListener('DOMContentLoaded', e => {
  const photoUploadModal = document.querySelector('#photoUploadModal');
  const photoInsertModal = document.querySelector('#photoInsertModal');
  const insertImageButton = document.querySelector('.insertImageButton');

  // photoInsertModalが表示される際のイベント
  photoInsertModal.addEventListener('DOMActivate', e => {
    if(!photoInsertModal.classList.contains('show')) { return; }
    const photoList = document.getElementsByClassName('photoList__item');
    addEventToPhotoList(photoList);
  });

  // photoInsertModalが非表示になる際のイベント
  photoInsertModal.addEventListener('DOMActivate', e => {
    if(photoInsertModal.classList.contains('show')) { return; }
    editClassList('.photoList__item--active', 'remove', 'photoList__item--active'); // 画像の選択状態を解除
    editClassList('.insertImageButton', 'add', 'disabled'); // 画像挿入ボタンを無効化
  });

  // photoUploadModalが非表示になる際のイベント
  photoUploadModal.addEventListener('DOMActivate', e => {
    if(photoUploadModal.classList.contains('show')) { return; }
    document.querySelector('#photoUploadNotice').innerHTML = ''; // モーダルのflashメッセージ削除
    document.querySelector('#photo_contents').value = ''; // モーダルのファイルフィールドを空にする
  });

  // 画像挿入ボタンが有効な状態でクリックされた際のイベント
  insertImageButton.addEventListener('click', e => {
    if(insertImageButton.classList.contains('disabled')) { return; }
    console.log('hello from insertImageButton');
  })
});


// ***************************
//         Functions
// ***************************

// モーダル中の各画像にイベントを設定
const addEventToPhotoList = (elements) => {
  for(let i = 0; i < elements.length; i++) {
    elements[i].addEventListener('click', e => {
      editClassList('.photoList__item--active', 'remove', 'photoList__item--active'); // 画像の選択状態を解除
      editClassList('.insertImageButton', 'remove', 'disabled'); // 画像挿入ボタンを有効化
      elements[i].classList.add('photoList__item--active'); // クリックされた画像を選択状態にする
    });
  }
};

// タグのclassを追加・削除
const editClassList = (classToFind, action, classToDo) => {
  element = document.querySelector(classToFind);
  if(!element) { return; }
  if(action === 'add' && !element.classList.contains(classToDo)) { element.classList.add(classToDo); }
  if(action === 'remove' && element.classList.contains(classToDo)) { element.classList.remove(classToDo); }
}
