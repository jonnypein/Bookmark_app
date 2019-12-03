import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Keeping you in the loop"],
    typeSpeed: 50,
    // loop: true
  });
}

export { loadDynamicBannerText };
