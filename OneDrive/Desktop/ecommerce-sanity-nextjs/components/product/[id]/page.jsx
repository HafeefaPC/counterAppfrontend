import React from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const productpage = ({ product }) => {
  return;
  <div>
    <Slider>
      {product.images.map((image, index) => (
        <div key={index}>
          <Image
            src={urlForImage(image)}
            width={200}
            height={200}
            alt={`Product Image ${index}`}
          />
        </div>
      ))}
    </Slider>
  </div>;
};
