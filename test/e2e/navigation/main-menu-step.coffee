describe 'Main menu navigation', () ->
  beforeEach () ->
    browser.get 'http://localhost:8000'

  it 'should select the homepage', () ->
    el = $ '.menu-component li:first-child a'

    expect(el.getAttribute('class')).toContain 'selected'

  it 'should change the page', () ->
    el = $ '.menu-component li:nth-child(2) a'
    href = el.getAttribute 'href'

    runs () ->
      el.click()

    waits 500

    runs () ->
      expect(browser.getCurrentUrl()).toContain href
      expect(el.getAttribute('class')).toContain 'selected'