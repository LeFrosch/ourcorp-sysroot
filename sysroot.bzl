_SYSROOT_BUILD = """
filegroup(
    name = "sysroot",
    srcs = glob(["**/*"], allow_empty=True),
    visibility = ["//visibility:public"],
)
"""

def _ourcorp_sysroot_impl(ctx):
    ctx.download_and_extract(
        integrity = "sha256-iqDp2xzmz8i6azC8V7sgE0D3AS4ff6+pMl98ooH4b1A=",
        stripPrefix = "x86_64-linux-gnu-glibc2.28-sysroot-llvm-20",
        url = ["https://github.com/user-attachments/files/22137276/x86_64-linux-gnu-glibc2.28-sysroot-llvm-20-v2.tar.gz"],
    )
    ctx.file("BUILD.bazel", _SYSROOT_BUILD)

ourcorp_sysroot = repository_rule(_ourcorp_sysroot_impl)
