import {Turbo} from "@hotwired/turbo-rails"
import "@unabridged/motion"
import "trix"
import "@rails/actiontext"

import "./controllers"
import "./channels"

Turbo.session.drive = false
