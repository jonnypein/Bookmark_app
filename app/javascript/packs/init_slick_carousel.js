import $ from 'jquery';
import { slick } from 'slick-carousel';

const initSlickCarousel = (selector, options = {}) => {
  $(selector).slick(options);
}

export { initSlickCarousel };
