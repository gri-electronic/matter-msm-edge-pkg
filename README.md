# APT-Repository: msm-edge-pkg

This ist the `apt` Repository for the msm-edge packages, which can be installed on a Raspberry Pi 5.

## Containing Packages

- ge-chip-tool
- msm-edge-wifi

## How it works

Make the repo known to the Raspberry Pi 5.

```bash
echo "deb [arch=arm64 trusted=yes] https://gri-electronic.github.io/msm-edge-pkg stable main" | sudo tee /etc/apt/sources.list.d/msm-edge.list
sudo apt update
```

Install the package

```bash
# Install newest package
sudo apt install msm-edge-wifi
sudo apt install ge-chip-tool

# Install a certain version of a package
sudo apt install msm-edge-wifi=1.0.0
```

## How to create an APT Repository on GitHub

[Wiki Doku](https://genius.gg.intern/dokuwiki/doku.php?id=entwicklung:apt-repository)
