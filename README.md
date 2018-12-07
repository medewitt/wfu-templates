
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis build
status](https://travis-ci.org/medewitt/wfutemplates.svg?branch=master)](https://travis-ci.org/medewitt/wfutemplates)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# wfutemplates

## Document Templates

The goal of `wfutemplates` is to codify some commonly used templates at
WFU and make report generation easier while adhering to a common visual
identity. This package is largely inspired by the `memor`
[package](https://github.com/hebrewseniorlife/memor) with slowly
evolving tweaks.

This package has a lot of the **Wake Forest University** logos.

## Course Website Template

Additionally, this package also has a project template that builds the
scaffolfing for a course website. The theme is inspired by [Steve V.
Miller](http://svmiller.com/) and modified to fit the Wake Forest colour
scheme. An early implementation of this project template can be seen
[here](https://michaeldewittjr.com/introduction_to_r/index.html). To get
the site up and running just modify the `_site.yml` file with your
personal information

    name: "Introduction to R"
    output_dir: "docs"
    navbar:
      title: "Data Analysis in R"
      right:
      - text: "Syllabus"
        icon: fa-handshake
        href: syllabus.html
      - text: "Lectures"
        icon: fa-book
        href: lectures.html
      - text: "Exercises"
        icon: fa-paper-plane
        href: exercises.html
      - text: "Resources"
        icon: fa-hand-paper
        href: resources.html
      - text: "Home"
        icon: fa-folder
        href: https://michaeldewittjr.com
    base_url: https://github.com/medewitt/introduction_to_r/
    output:
      html_document:
        theme: cosmo
        highlight: textmate
        css: style.css
        df_print: paged
        toc: true
        toc_float: yes
        bibliography: library.bib
        biblio-style: apalike
        include:
          after_body: footer.html
          in_header: GA.html
    instructor: "Michael DeWitt"
    address1: "Office of Institutional Research"
    address2: "309 Reynolda Hall"
    address3: "Winston- Salem, NC, 27106"
    github: "medewitt"
    email: "dewittme.wfu.edu"
    GA: "GA Code"

## Installation

You can install the released version of wfutemplates from
[github](https://github.com) with:

``` r
devtools::install_github("medewitt/wfutemplates")
```

# Contributing

Please note that the ‘wfutemplates’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
