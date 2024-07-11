# OFDR-Catheter
MATLAB scripts for OFDR strain sensing with catheter


# RUNME MATLAB script
**Purpose:** This file executes the tasks below. 

## TODO
### General
| Variable   | Format   | Possible inputs                                                     | Description                                      |
|------------|----------|---------------------------------------------------------------------|--------------------------------------------------|
| `task`     | `string` | "Strain" <br>"Calibration" <br>"Validation" <br>"Shape" <br>"Force" | Name of the task to perform.                     |
| `loadname` | `string` |                                                                     | First half of the name of the file to be loaded. |
| `savename` | `string` |                                                                     | First half of the name of the file to be saved.  |


# Strain
**Purpose:** Process raw .csv data into strain data.

## File path structure
- Folder
  - Fiber 1 / Fiber 2 / Fiber 3
    - References
      - .csv 
    - Samples
      - Categories (if applicable)
        - .csv   

## Inputs
| Input     | Format   | Dimensions | Description                                         |
|-----------|----------|------------|-----------------------------------------------------|
| `dirraw`  | `string` | 1x1        | Path leading to individual fiber folders.           |
| `gen`     | `struct` | 1x1        | General parameters.                                 |
| `dirsave` | `string` | 1x1        | Path to save the strain results in *_sig.mat* file. |

## Outputs
Saves outputs in *_sig.mat* file at `dirsave`.
| Output           | Format | Dimensions                                                                | Description                                                                                     |
|------------------|--------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `results.x`      | `cell` | [resolution]x1 <br> 1x[pts]                                               | Longitudinal positions array for each spatial resolution.                                       |
| `results.fiber1` | `cell` | [resolution]x1 <br> [samples] x [pts] x [references] x [categories (N/A)] | Strain signals for each spatial resolution, samples, references and, if applicable, categories. |
| `results.fiber2` | `cell` | [resolution]x1 <br> [samples] x [pts] x [references] x [categories (N/A)] | Idem                                                                                            |
| `results.fiber3` | `cell` | [resolution]x1 <br> [samples] x [pts] x [references] x [categories (N/A)] | Idem                                                                                            |


# Calibration
**Purpose:** Extract the geometrical parameters of the sensor and extrapolate trends in the nonlinear tip curvature behavior.

## Inputs
| Input     | Format   | Dimensions | Description                                                |
|-----------|----------|------------|------------------------------------------------------------|
| `dirload` | `string` | 1x1        | Path to load the strain results in *_sig.mat* file.        |
| `gen`     | `struct` | 1x1        | General parameters.                                        |
| `dirsave` | `string` | 1x1        | Path to save the calibration results in *_calib.mat* file. |


## Outputs
Saves outputs in *_calib.mat* file at `dirsave`.
| Output       | Format | Dimensions                               | Description                                               |
|--------------|--------|------------------------------------------|-----------------------------------------------------------|
| `calib.g`    | `cell` | [resolution]x1 <br> [pts] x [references] | Calibrated gauge array for each resolution and reference. |
| `calib.tet1` | `cell` | [resolution]x1 <br> [pts] x [references] | Calibrated tet1 array for each resolution and reference.  |


# Validation
**Purpose:** Validate the calibration results.

## Inputs
| Input | Format | Dimensions | Description |
|-------|--------|------------|-------------|

## Outputs
| Output | Format | Dimensions | Description |
|--------|--------|------------|-------------|


# Shape
**Purpose:** Reconstruct the shape of the sensor from the measured strain signals.

## Inputs
| Input | Format | Dimensions | Description |
|-------|--------|------------|-------------|

## Outputs
| Output | Format | Dimensions | Description |
|--------|--------|------------|-------------|
