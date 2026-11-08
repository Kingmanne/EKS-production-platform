# IRSA: only the external-dns service account may assume this role,
# and it may only change records in the lab zone.
data "aws_route53_zone" "lab" {
  name         = var.lab_zone_name
  private_zone = false
}

locals {
  oidc_issuer = replace(module.eks.oidc_issuer_url, "https://", "")
}

data "aws_iam_policy_document" "external_dns_trust" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.eks.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer}:sub"
      values   = ["system:serviceaccount:external-dns:external-dns"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "external_dns" {
  name               = "${var.cluster_name}-external-dns"
  assume_role_policy = data.aws_iam_policy_document.external_dns_trust.json
}

data "aws_iam_policy_document" "external_dns" {
  statement {
    sid       = "ChangeLabZoneOnly"
    actions   = ["route53:ChangeResourceRecordSets", "route53:ListResourceRecordSets", "route53:ListTagsForResources"]
    resources = [data.aws_route53_zone.lab.arn]
  }

  statement {
    sid       = "DiscoverZones"
    actions   = ["route53:ListHostedZones"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "external_dns" {
  name   = "route53-lab-zone"
  role   = aws_iam_role.external_dns.id
  policy = data.aws_iam_policy_document.external_dns.json
}
