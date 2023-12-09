import {Application} from "@hotwired/stimulus"
import consumer from "../channels/consumer"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
application.consumer = consumer
window.Stimulus = application

export {application}


/* Aside: submenus toggle */
Array.from(document.getElementsByClassName('menu is-menu-main')).forEach(el => {
  Array.from(el.getElementsByClassName('has-dropdown-icon')).forEach(elA => {
    elA.addEventListener('click', e => {
      const dropdownIcon = e.currentTarget
        .getElementsByClassName('dropdown-icon')[0]
        .getElementsByClassName('material-symbols-outlined')[0]

      e.currentTarget.parentNode.classList.toggle('is-active')
      dropdownIcon.classList.toggle('mdi-plus')
      dropdownIcon.classList.toggle('mdi-minus')
    })
  })
})

/* Aside Mobile toggle */
Array.from(document.getElementsByClassName('hb-aside-mobile-toggle')).forEach(el => {
  el.addEventListener('click', e => {
    const dropdownIcon = e.currentTarget
      .getElementsByClassName('icon')[0]
      .getElementsByClassName('material-symbols-outlined')[0]

    document.documentElement.classList.toggle('has-aside-mobile-expanded')
    if (dropdownIcon.textContent === 'menu_open'){
      dropdownIcon.textContent = 'menu'
    } else {
      dropdownIcon.textContent = 'menu_open'
    }
  })
})

/* NavBar menu mobile toggle */
Array.from(document.getElementsByClassName('hb-navbar-menu-toggle')).forEach(el => {
  el.addEventListener('click', e => {
    const dropdownIcon = e.currentTarget
      .getElementsByClassName('icon')[0]
      .getElementsByClassName('material-symbols-outlined')[0]

    document.getElementById(e.currentTarget.getAttribute('data-target')).classList.toggle('is-active')
    if (dropdownIcon.textContent === 'close'){
      dropdownIcon.textContent = 'more_vert'
    } else {
      dropdownIcon.textContent = 'close'
    }
  })
})

/* Modal: open */
Array.from(document.getElementsByClassName('hb-modal')).forEach(el => {
  el.addEventListener('click', e => {
    const modalTarget = e.currentTarget.getAttribute('data-target')

    document.getElementById(modalTarget).classList.add('is-active')
    document.documentElement.classList.add('is-clipped')
  })
});

/* Modal: close */
Array.from(document.getElementsByClassName('hb-modal-close')).forEach(el => {
  el.addEventListener('click', e => {
    e.currentTarget.closest('.modal').classList.remove('is-active')
    document.documentElement.classList.remove('is-clipped')
  })
})

/* Notification dismiss */
Array.from(document.getElementsByClassName('hb-notification-dismiss')).forEach(el => {
  el.addEventListener('click', e => {
    e.currentTarget.closest('.notification').classList.add('is-hidden')
  })
})
