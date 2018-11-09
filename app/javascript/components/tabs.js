
// ON CLICK OF A TAB
// 1. Hide all other tabs
// 2. Make this tab active
// 3. Check the dataset.target of this tab (to get the target tab content)
// 4. Hide all tab-contents
// 5. Display the target tab content






// function initUpdateNavbarOnScroll() {
//   const navbar = document.querySelector('.navbar-wagon');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-wagon-white');
//       } else {
//         navbar.classList.remove('navbar-wagon-white');
//       }
//     });
//   }
// }

// export { initUpdateNavbarOnScroll };

function deactivateTabs(tabs) {
  tabs.forEach(tab => tab.classList.remove('active'))
}

function hideTabContents(contents) {
  contents.forEach((content) => {
    content.hidden = true
  })
}

const allContents = document.querySelectorAll('.tab-content');

function switchBookingTabsOnClick() {
const allTabs = document.querySelectorAll('.tab');

allTabs.forEach((tab) => {
 tab.addEventListener('click', (event)=> {
  deactivateTabs(allTabs)
  hideTabContents(allContents)
  console.log('a');
  console.log(allContents);
  console.log('a');
  event.currentTarget.classList.add("active")
  const contentId = event.currentTarget.dataset.target.toString();
  const relevantContent = document.getElementById(contentId);
  relevantContent.hidden = false
  console.log(relevantContent);

});
})

}

// function switchBookingTabsOnClick() {
//   const allTabs = document.querySelectorAll('.tab');
//   allTabs.addEventListener('click', (event) => {
//     console.log(event);
//   })
// }

export { switchBookingTabsOnClick };



  // contentToActivate = document.getElementById(event.currentTarget.dataset.target);
  // contentToActivate.hidden = false;
  // contentId = event.currentTarget.dataset.target
  // stuff = event.currentTarget.dataset.target
  // console.log(stuff.typeOf())
