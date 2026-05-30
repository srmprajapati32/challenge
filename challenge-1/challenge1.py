import hashlib

products = [
    "PRODUCT:A123|BATCH:B001|OWNER:0xABC123",
    "PRODUCT:A124|BATCH:B001|OWNER:0xABC123",
    "PRODUCT:A125|BATCH:B002|OWNER:0xDEF456"
]

for product in products:

    original_hash = hashlib.sha256(product.encode()).hexdigest()

    modified_product = product.replace("A", "B", 1)

    modified_hash = hashlib.sha256(modified_product.encode()).hexdigest()

    print("\n============================")
    print("Original Input:")
    print(product)

    print("\nOriginal Hash:")
    print(original_hash)

    print("\nModified Input:")
    print(modified_product)

    print("\nModified Hash:")
    print(modified_hash)

    print("\nHashes Match?")
    print(original_hash == modified_hash)