"use client";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useState } from "react";
import client from "../../sanity/lib/client";
import { urlForImage } from "../../sanity/lib/image";
// import Slider from "react-slick";
// import "slick-carousel/slick/slick.css";
// import "slick-carousel/slick/slick-theme.css";

export default function Products() {
  const [data, setData] = useState([]);

  useEffect(() => {
    const groqQuery = `
      *[_type == "product"] {
        title,
        description,
        images[],
        price,
        rating
      }
    `;

    client
      .fetch(groqQuery)
      .then((data) => {
        console.log("Fetched data:", data);
        setData(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);
  const renderRatingStars = (rating) => {
    const stars = [];
    for (let i = 0; i < rating; i++) {
      stars.push(
        <span key={i} className="text-yellow-500">
          &#9733;
        </span>
      );
    }
    return stars;
  };
  const handleClick = (product) => {
    productpage(product);
  };

  return (
    <div className="flex p-4 gap-5">
      {data.map((product, index) => (
        <div
          key={product.id}
          className="border border-gray-300 rounded-2xl w-1/4 relative"
        >
          <Link href={`/product/${product.id}`} key={product.id}>
            <div className=" gap-4 p-10" onClick={handleClick}>
              {product.images.map((image, index) => (
                <div key={index}>
                  {index === 0 && (
                    <Image
                      src={urlForImage(image)}
                      width={200}
                      height={200}
                      alt={`Product Image ${index}`}
                    />
                  )}
                </div>
              ))}

              <div className="absolute bottom-0 left-0 w-full bg-white p-3">
                <button className="bg-black text-white p-2 w-full">
                  Add to Cart
                </button>
                <h2 className=" font-bold">{product.title}</h2>
                {/* <p>{product.description}</p> */}
                <p className="text-[#FF0000]">₹{product.price}</p>
                <div className="flex items-center">
                  {renderRatingStars(product.rating)}
                </div>
              </div>
            </div>
          </Link>
        </div>
      ))}
    </div>
  );
}
