class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.56.0.tgz"
  sha256 "5628c1e9f06aa8e739043dec02e6e227e8cd848f39a6be74027303cec8140ae3"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "2899c13b9833a1bc4af275e0f09ef94ce261f0072c7c76d1f8aaf72777366a7c"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"fern", "init", "--docs", "--org", "brewtest"
    assert_path_exists testpath/"fern/docs.yml"
    assert_match "\"organization\": \"brewtest\"", (testpath/"fern/fern.config.json").read

    system bin/"fern", "--version"
  end
end
