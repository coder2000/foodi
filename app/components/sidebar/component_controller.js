import { Controller } from "@hotwired/stimulus";
import { enter, leave } from "el-transition";
export default class extends Controller {
  static targets = ["overlay", "menu", "button", "modal"];

  show(event) {
    event.preventDefault();

    this.modalTarget.classList.remove("hidden");

    enter(this.overlayTarget, "sidebar-overlay");
    enter(this.menuTarget, "sidebar-menu");
    enter(this.buttonTarget, "sidebar-button");
  }

  hide(event) {
    event.preventDefault();

    this.modalTarget.classList.add("hidden");

    leave(this.overlayTarget, "sidebar-overlay");
    leave(this.menuTarget, "sidebar-menu");
    leave(this.buttonTarget, "sidebar-button");
  }
}
