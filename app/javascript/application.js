// Entry point for the build script in your package.json

import { Turbo } from "@hotwired/turbo-rails";
import TurboPower from "turbo_power";

import "./controllers"
import "trix"
import "@rails/actiontext"
import "./config"
import "./channels"

TurboPower.initialize(Turbo.StreamActions);
