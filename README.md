# APT-Repository: matter-msm-edge-pkg

This ist the `apt` Repository for the msm-edge packages, which can be installed on a Raspberry Pi 5.

## Containing Packages

- ge-chip-tool
- msm-edge-wifi

## How it works

Make the repo known to the Raspberry Pi 5.

```bash
echo "deb [arch=arm64 trusted=yes] https://gri-electronic.github.io/matter-msm-edge-pkg stable main" | sudo tee /etc/apt/sources.list.d/griesser-electronic.list
sudo apt update
```

Install the package

```bash
# Install newest package
sudo apt install ge-msm-edge-wifi-api
sudo apt install ge-chip-tool
sudo apt install ge-msm-edge-ota-api

# Install a certain version of a package
sudo apt install ge-msm-edge-wifi-api=1.0.0
```

## How to create an APT Repository on GitHub

[Wiki Doku](https://genius.gg.intern/dokuwiki/doku.php?id=entwicklung:apt-repository)
