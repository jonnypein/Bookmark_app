import "bootstrap";
import 'slick-carousel/slick/slick.css';
import './movie_search';
import { initSlickCarousel } from './init_slick_carousel';
import { loadDynamicBannerText } from '../components/banner';

initSlickCarousel('.carousel', {
  infinite: true,
  mobileFirst: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  adaptiveHeight: true,
  autoplay: false,
  prevArrow: '<i class="fas fa-angle-left nav-arrows" aria-hidden="false"></i>',
  nextArrow: '<i class="fas fa-angle-right nav-arrows" aria-hidden="false"></i>',
  responsive: [
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    }
  ]
});

let letsGoInfo = document.querySelector('#banner-typed-text');
if (letsGoInfo) {
  loadDynamicBannerText();
}


