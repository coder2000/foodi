const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  mode: "jit",
  purge: [
    "**/views/**/*.{slim,erb}",
    "**/javascript/**/*.{js,ts,jsx,tsx}",
    "**/components/**/*.{slim,erb,rb}",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        foodi: {
          100: "#d3e4da",
          200: "#a6c9b4",
          300: "#7aae8f",
          400: "#4d9369",
          500: "#217844",
          600: "#1a6036",
          700: "#144829",
          800: "#0d301b",
          900: "#07180e",
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/line-clamp"),
    require("@tailwindcss/typography"),
  ],
};
