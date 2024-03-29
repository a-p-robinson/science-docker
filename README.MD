# science-docker

Dockerfiles and associated scripts for building scientific software in [Docker](https://www.docker.com/) containers.

## Software

### `ECAT`
- [Siemens ECAT7 Format](http://www.turkupetcentre.net/petanalysis/format_image_ecat.html)
- root-u18.04:5.34.38 base
- Compiled from source
- 
### `Gate-8.2`
- [GATE 8.2](http://www.opengatecollaboration.org/)
- root-u18.04:5.34.38 base
- Complied from source
- Requires `LMF, ECAT, geant4`

### `geant4`
- [Geant4](https://geant4.web.cern.ch/)
- Ubuntu 18.04 base
- Compiled from source (multi-thread disabled)

### `LMF`
- [List Mode Format](https://opengate.readthedocs.io/en/latest/compilation_instructions.html#lmf-3)
- root-u18.04:5.34.38 base
- Compiled from source
 
### `root5-binary`
- [ROOT5 (forever!)](https://root.cern.ch/)
- Ubuntu 14.04 base
- Using precomplied binaries from https://root.cern/download/

### `root5-u18.04`
- [ROOT5 (forever!)](https://root.cern.ch/)
- Ubuntu 18.04 base
- Compiled from source

### `root6-binary`
- [ROOT6](https://root.cern.ch/)
- Ubuntu 20.04 base
- Using precomplied binaries from https://root.cern/download/
- Recreation of https://github.com/root-project/root-docker/tree/master/ubuntu

### `STIR`
- [STIR](http://stir.sourceforge.net/)
- root-u18.04:5.34.38 base
- Compiled from source

### `STIR-NPL`
- [STIR](http://stir.sourceforge.net/) with [NPL](https://www.npl.co.uk/) extensions
- stir-u18.04:4.0 base
- Compiled from source
- **NB: Requires access to NPL repository**

## Usage

### Building

- `build.sh` in each subdirectory
- Required build order,
  - `root5-u18.04`
  - `geant4`
  - `LMF`
  - `ECAT`
  - `Gate-8.2`

### Running

- `wrap.sh` in each subdirectory (where appropriate) can be used to pass X11 and `$PWD` to the container eg: 
  - `alias root='./rootu18.04/wrap.sh'`
  - `alias Gate='./Gate-8.2/wrap.sh'`

## Todo

- [X] Build cluster tools for Gate
- [X] Add latest Gate (9.0)
  - [X] Needs new version of Geant4
  - [X] ROOT6? - works with ROOT5
  - [ ] Include OpenRTK?
- [X] Add STIR
- [ ] Add ROOT6 from source
- [ ] Add GATE 9.2
- [ ] Add dawn renderer
- [ ] Add radware
- [ ] Add scripts and instructions for compiling code using containers