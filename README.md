# `template-ruby-gem`

Built upon [`ParadoxV5/mygem`](https://github.com/ParadoxV5/mygem),
this is a moderate yet thorough template for a Ruby C extension project.
Note: just `gem`. The `rake` is for test-building and invoking minitest (See [§Rakefile](#Rakefile).


## How to Setup

* Rename all occurrences of `mygem`, lower- or title-case, with the name of your epic Gem.
  * [`ext/mygem/`](ext/mygem/)
  * [`ext/mygem/mygem.c` and Line 3](ext/mygem/mygem.c#L3)
  * [`ext/mygem/extconf.rb` Line 6](ext/mygem/extconf.rb#L6)
  * [`lib/mygem/`](lib/mygem/)
  * [`lib/mygem.rb` and Line 1 & 2](lib/mygem.rb#L1-2)
  * [`lib/mygem/version.rb` Line 3](lib/mygem/version.rb#L3)
  * [`sig/mygem.rbs` and Line 1](sig/mygem.rbs#L1)
  * [`test/mygem_test.rb` and Lines 3 & 4](test/mygem_test.rb#L3-4)
  * [`mygem.gemspec` and Lines 2, 5 & 7](mygem.gemspec#L2-L7)
  * [`Rakefile` Lines 12 & 15](Rakefile#L12-L15)
* Update the [`gemspec`](mygem.gemspec) with your Gem’s information. (See [§`*.gemspec`](#gemspec))
* Overwrite this `README` with an introduction to your epic project.
* Replace *this template’s* [`LICENSE.txt`](LICENSE.txt) with
  [one](https://choosealicense.com) that engraves your honor for posterity.
* Add [your “Push rubygem” API key](https://rubygems.org/profile/api_keys) as a
  [GitHub Secret](https://docs.github.com/actions/security-guides/encrypted-secrets)
  (aptly) named `GEM_HOST_API_KEY`. (See [§package.yml](#packageyml)))


## What’s Inside

Follow [the convention](https://guides.rubygems.org/patterns/#file-names) regarding the file structure:


### [`ext/**`](ext/)

This is the folder where people put their C sources under a sub-folder,
including the [init. function](ext/mygem/mygem.c) and the [config script](ext/mygem/extconf.rb).
Third-party headers can be in `ext/include` for organization.

### [`lib/**`](lib/)

This is the folder where people put their Ruby sources, starting with their
[entry script](lib/mygem.rb) right under `lib` and the rest in a sub-folder.


### [`sig/**`](sig/)

Have you heard of [RBS](https://github.com/ruby/rbs)?
Yep, Ruby 3 introduced this official type checking system.
The convention is to put your RBS signatures in this folder.


### [`*.gemspec`](mygem.gemspec)

The `gemspec` is [the metadata file](https://guides.rubygems.org/specification-reference/) for your epic Gem.
Any file name is technically acceptable, but a `.gemspec` suffix is the convention.
I have also neatly prepared developer, license and URL information lines in the metadata,
though you can remove any bells and whistles that don’t apply to your project.


### [`Gemfile`](Gemfile)

[The `Gemfile`](https://bundler.io/guides/gemfile.html) is the **Bundler** project file where
you *would* declare dependencies **if only using Bundler** (i.e., not cutting a Gem).
For Gems, the [`gemspec`](#gemspec) already covers this role in its metadata – *mostly*.

> There was a discussion before about whether the `Gemfile` makes `.gemspec`’s
> [`add_development_dependency`](https://guides.rubygems.org/specification-reference/#add_development_dependency)
> obsolete: rubygems/rubygems#1104
> 
> Overall, I took their conclusion as – Bundler (`Gemfile`) and RubyGem (`.gemspec`) are two separate utilities;
> it’s just good Rubyists like us that use them together.


### [`LICENSE.txt`](LICENSE.txt)

See [§License](#License)


### [Rakefile](Rakefile)

The cool li’l testing toolkit minitest does not come with an executable,
but rather a Ruby API that generates a handful of [Rake](https://github.com/ruby/rake) tasks.
While we are at it, we might as well include [`rake-compiler`](https://github.com/rake-compiler/rake-compiler/actions)
to automate compiling C during development.


### [`README.md`](README.md)

You are reading this right now, so you should know what this is for…


### [`.github/workflows/*`](.github/workflows/)

Inside this folder are small but thoroughly configured ([minimal modification](#How-to-Setup) required)
[GitHub Actions](https://github.com/features/actions) scripts that enable basic continuous deployment:

#### [`documentation.yml`](.github/workflows/documentation.yml)
Generate [YARD docs](https://yardoc.org) and
[publish to GitHub Pages](https://github.blog/changelog/2022-07-27-github-pages-custom-github-actions-workflows-beta)
after the `main` branch receives an update in the sources ([`ext/`](ext/) & [`lib/`](lib/)) folders.

#### [`test.yml`](.github/workflows/test.yml)
Run tests independently (`rake test:isolated`) after any branch receives an update
on the [`.gemspec`](mygem.gemspec) (in the event of library version changes) or
in the sources ([`ext`](ext/) & [`lib/`](lib/)) or test ([`test`](test/)) folders.

#### [`type_check.yml`](.github/workflows/type_check.yml)
Check your RBS appendices (see [§sig/**](#sig)) after any branch receives an update
on the [`.gemspec`](mygem.gemspec) (in the event of library version changes) or
in the Ruby ([`lib`](lib/)) or signature ([`sig`](sig/)) folders.

#### [`package.yml`](.github/workflows/package.yml)
Publish to RubyGems after the GitHub repo publishes a Release. This workflow requires a “Push rubygem”
API key as a GitHub Secret named `GEM_HOST_API_KEY` in order to authenticate an upload for you.

### [`.github/dependabot.yml`](.github/dependabot.yml)

What’s a dependency, you may ask? Well, if your project uses another project to do stuff,
your project then *depend*s on that project; got it?
[Dependabot](https://github.blog/2020-06-01-keep-all-your-packages-up-to-date-with-dependabot)
can do the update check part of the housekeeping so you can focus on your own responsibility.


### [`.yardopts`](.yardopts)

[The `.yardopts` file ](https://rubydoc.info/gems/yard/file/docs/GettingStarted.md#yardopts-options-file)
records the default command-line parameters, so both you and automated doc bots only need to execute `yard doc`.

* `--markup markdown` – ~~Who doesn’t use Markdown?~~
* `--markup-provider commonmarker` – Use [the CommonMarker Gem](https://github.com/gjtorikian/commonmarker)
  instead of *whatever impaired default it happens to be out-of-the-box* (mine was `RDoc::Markdown`).


### [`.gitignore`](.gitignore)

[The `.gitignore` file](https://git-scm.com/docs/gitignore) lists file patterns to exclude from Git’s records.

* Omitting `Gemfile.lock` and `rbs_collection.lock.yaml` encourages the use (or experimentation)
  of updated (yet (hopefully) compatible) dependency versions. 
  Check them in if your paranoia prefers the guarantee of identical functioning dependency versions.
* Don’t include IDE (just JetBrains ones like [RubyMine](https://www.jetbrains.com/ruby) at the movement)
  configurations unless you want to enforce your organization’s digital environment.


## License

I have determined that this template is all traditional knowledge and no copyrightable production.
Therefore, I am licensing this template under the infamous [WTFPL](http://www.wtfpl.net).
