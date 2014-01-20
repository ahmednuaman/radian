describe('Main menu navigation', function() {
  beforeEach(function() {
    browser.get('http://localhost:8000');
  });

  it('should select the homepage', function() {
    var el = $('.menu-component li:first-child a');

    expect(el.getAttribute('class')).toContain('selected');
  });

  it('should change the page', function() {
    var el = $('.menu-component li:nth-child(2) a'),
        href = el.getAttribute('href');

    runs(function() {
      el.click();
    });

    waits(500);

    runs(function() {
      expect(browser.getCurrentUrl()).toContain(href);
      expect(el.getAttribute('class')).toContain('selected');
    });
  });
});
