import Products from "../components/product/page";
import Navbar from "../common/navbar"

import { Image } from "next/image";

export default function Home() {
  return (
   <>
      <Navbar/>
      <Products/>
   </>
  );
}
