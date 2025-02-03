/** @type {import('tailwindcss').Config} */

import { designTokens } from "./src/designTokens";

module.exports = {
  content: ["./src/**/*.{html,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        //   body: ["Edu AU VIC WA NT Arrows"],
        //  body: ["Mulish"],
        ...designTokens.fontFamily,
      },

      colors: {
        ...designTokens.colors,
      },

      fontSize: {
        //...designTokens.fontSize,
      },

      spacing: {
        ...designTokens.spacing,
      },

      borderRadius: {
        ...designTokens.borderRadius,
      },
      fontWeight: {
        ...designTokens.fontWeight,
      },
    },
  },
  plugins: [],
};
