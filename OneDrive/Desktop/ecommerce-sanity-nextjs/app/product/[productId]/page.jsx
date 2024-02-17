"use client";
import Navbar from "../../../common/navbar";
import Image from "next/image";
import React, { useEffect, useState } from "react";
import client from "../../../sanity/lib/client";
import { urlForImage } from "../../../sanity/lib/image";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

export default function produtdetails({ params }) {
  const productId = params.productId; // Access the specific parameter 'productId'
  const [data, setData] = useState([]);

  useEffect(() => {
    const groqQuery = `
      *[_type == "product"] {
        id,
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

  return (
    <>
      <Navbar />
      <div className="grid grid-cols-5 items-center">
        {data.map(
          (product) =>
            productId.toString() === product.id.toString() && (
              <div
                key={product.id}
                className="border border-gray-300 rounded-2xl w-full relative col-start-2 col-span-3 bg-black"
              >
                <div className=" gap-4 p-10 items-center  justify-center    ">
                  <Slider>
                    {product.images.map((image, index) => (
                      <div key={index} className="w-1/2 items-center">
                        <Image
                          src={urlForImage(image)}
                          width={400}
                          height={400}
                          alt={`Product Image ${index}`}
                          className=" object-cover w-full "
                        />
                      </div>
                    ))}
                  </Slider>
                </div>

                <div className="absolute bottom-0 left-0 w-full bg-white p-3">
                  <button className="bg-black text-white p-2 w-full">
                    Add to Cart
                  </button>
                  <h2 className="font-bold">{product.title}</h2>

                  <p className="text-[#FF0000]">₹{product.price}</p>
                  <p>{product.description}</p>
                  <div className="flex items-center">
                    {renderRatingStars(product.rating)}
                  </div>
                </div>
              </div>
            )
        )}
      </div>
    </>
  );
}
