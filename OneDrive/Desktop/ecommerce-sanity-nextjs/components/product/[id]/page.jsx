import React from "react";

const productpage = ({ product }) => {
  return;
  <div>
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
  </div>;
};
