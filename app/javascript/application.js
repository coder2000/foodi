// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import Alpine from "alpinejs";
import "@kingshott/iodine";
import form from "./form";

window.Alpine = Alpine;

Alpine.data("form", form);

Alpine.start();
