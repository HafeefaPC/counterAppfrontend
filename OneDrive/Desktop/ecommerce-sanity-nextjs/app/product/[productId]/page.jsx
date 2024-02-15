"use client";
import Navbar from "../../../common/navbar";
import Image from "next/image";
import React, { useEffect, useState } from "react";
import client from "../../../sanity/lib/client";

export default function produtdetails({ params }) {
  const productId = params;

  const [product, setProduct] = useState(null);

  useEffect(() => {
    if (!productId) return;

    const groqQuery = `
        *[_type == "product" && _id == $productId] {
          id,
          title,
          description,
          images[],
          price,
          rating
        }[0]
      `;

    const params = { productId };

    client
      .fetch(groqQuery, params)
      .then((product) => {
        console.log("Fetched product:", product);
        setProduct(product);
      })
      .catch((error) => {
        console.error("Error fetching product:", error);
      });
  }, [productId]);

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

  return (
    <>
      <div className="flex p-4 gap-5">
        {product && (
          <div
            key={product.id}
            className="border border-gray-300 rounded-2xl w-1/4 relative"
          >
            <div className=" gap-4 p-10">
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
          </div>
        )}
      </div>
    </>
  );
}
