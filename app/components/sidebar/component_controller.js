import { Controller } from "@hotwired/stimulus";
import { enter, leave } from "el-transition";

export default class extends Controller {
  static targets = ["overlay", "menu", "button"];

  show(event) {
    event.preventDefault();

    enter(this.overlayTarget, "sidebar-overlay");
    enter(this.menuTarget, "sidebar-menu");
    enter(this.buttonTarget, "sidebar-button");
  }

  hide(event) {
    event.preventDefault();

    leave(this.overlayTarget, "sidebar-overlay");
    leave(this.menuTarget, "sidebar-menu");
    leave(this.buttonTarget, "sidebar-button");
  }
}
