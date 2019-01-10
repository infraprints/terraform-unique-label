locals {
  transformed_attributes = "${concat(var.attributes, list(random_id.unique.hex))}"
  original_tags          = "${join(var.delimiter, compact(concat(list(var.namespace, var.stage, var.name), local.transformed_attributes)))}"
}

resource "random_id" "unique" {
  byte_length = "${var.byte_length}"
}

locals {
  transformed_tags = "${lower(local.original_tags)}"
}

locals {
  id = "${local.transformed_tags}"

  namespace  = "${lower(format("%v", var.namespace))}"
  stage      = "${lower(format("%v", var.stage))}"
  name       = "${lower(format("%v", var.name))}"
  attributes = "${lower(format("%v", join(var.delimiter, compact(local.transformed_attributes))))}"

  constants = {
    Name      = "${local.id}"
    Namespace = "${local.namespace}"
    Stage     = "${local.stage}"
  }

  tags = "${merge(local.constants, var.tags)}"
}
