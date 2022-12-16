# My pandoc templates

A collection of templates I use. 💁

* [Documents](./doc). To clone `doc` subdirectory run 
  ``` bash
  git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  git@github.com:liesnikov/pandoc-templates.git; \
  cd pandoc-templates; git sparse-checkout set doc; \
  mv doc ../; cd ../; \
  rm -rf pandoc-templates;
  ```
* [Slides](./slides). To clone `slides` subdirectory run
  ``` bash
  git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  git@github.com:liesnikov/pandoc-templates.git; \
  cd pandoc-templates; git sparse-checkout set slides; \
  mv slides ../; cd ../; \
  rm -rf pandoc-templates;
  ```
