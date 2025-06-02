import { defineConfig } from "vite";
import path from "path"
import react from "@vitejs/plugin-react";
import * as fs from 'node:fs'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    https: {
      key: fs.readFileSync('./cert.key'), cert: fs.readFileSync('./cert.crt')
    }
  },
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
