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
}
