var LESSON_HEADINGS = [
  'Introduction',
  'Learning Outcomes',
  'Assignment',
  'Additional Resources'
];

function getElements(selector) {
  return document.querySelectorAll(selector);
}

function kebabCase(text) {
  return text.toLowerCase().match(/\w+/g).join('-');
}

function setTargetForExternalLinks() {
  getElements('.lesson-content a[href^=http]').forEach(function(externalLink) {
    externalLink.setAttribute('target', '_blank');
  });
}

function navigationElement(headingText) {
  return (
    '<div class="lesson-navigation__item">' +
    '<div class="lesson-navigation__circle"></div>' +
    '<div class="lesson-navigation__title">' +
    '<a class="lesson-navigation__link grey" href="#' + kebabCase(headingText) + '" data-turbolinks="false">' + headingText +
    '</a></div></div>'
  );
}

function lessonNavigation(headings) {
  return headings.map(navigationElement).join('');
}

function getInnerText(heading) {
  return heading.innerText;
}

function isCommonHeading(heading) {
  return LESSON_HEADINGS.indexOf(heading) !== -1;
}

function getLessonHeadings() {
  var headingElements = getElements('.lesson-content h3');

  return Array.prototype.slice.call(headingElements)
  .map(getInnerText)
  .filter(isCommonHeading);
}

function addActiveClass() {
  var links = getElements('.lesson-navigation__link');

  window.onhashchange = function() {
    links.forEach(function(link) {
      if (link.hash == window.location.hash) {
        link.classList.add('active');
        link.parentNode.previousSibling.classList.add('active');
      } else {
        link.classList.remove('active');
        link.parentNode.previousSibling.classList.remove('active');
      }
    });
  }
}

function constructLessonNavigation() {
  var commonHeadings = getLessonHeadings();
  if (commonHeadings.length < 2) {
    var navigationColumn = document.querySelector('.lesson .col-lg-3');
    var lessonColumn = document.querySelector('.lesson .row');

    navigationColumn.classList.add('d-none');
    lessonColumn.classList.add('justify-content-center');
  } else {
    var lessonNavigationHTML = lessonNavigation(commonHeadings);
    var lessonNavigationElement = document.querySelector('.lesson-navigation');

    lessonNavigationElement.innerHTML = lessonNavigationHTML;
    addActiveClass();
    Stickyfill.add(lessonNavigationElement);
  }
}

function isLessonPage() {
  return document.querySelector('.lesson') !== null;
}

function constructLessonSections() {
  var lessonHeadings = getElements('.lesson-content h3');
  lessonHeadings.forEach(function(heading) {
    const id = heading.getAttribute('id');
    heading.removeAttribute('id');

    var section = document.createElement('div')
    section.setAttribute('id', id);

    if (isCommonHeading(heading.innerText)) {
      section.classList.add('scrollspy');
    }

    heading.parentNode.insertBefore(section, heading);

    while (heading.nextElementSibling !== null &&
      heading.nextElementSibling.tagName !== 'H3') {
      section.appendChild(heading.nextElementSibling);
    }

    section.insertBefore(heading, section.firstChild);
  });
}

function spyLessonSections() {
  $('.scrollspy').scrollSpy({ scrollOffset: 50 });
}

document.addEventListener('turbolinks:load', function() {
  if (!isLessonPage()) return;
  setTargetForExternalLinks();

  if (!window.matchMedia('(min-width: 992px)').matches) return;

  constructLessonNavigation();
  constructLessonSections();
  spyLessonSections();
});
