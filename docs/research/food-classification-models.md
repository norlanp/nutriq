# Food Classification Model Alternatives (Research)

> Research for todo: "Research alternative broad-coverage, mobile-ready food-classification models to Food V1."
> Date: 2026-08-15

## Constraints (from Nutriq's architecture)

Any replacement must satisfy all of the following, derived from `docs/features.md`
and `lib/features/ai_food_scanner/data/food_classifier_service.dart`:

1. **On-device, offline** — no cloud calls. Nutriq is privacy-first, local-only.
2. **TensorFlow Lite compatible** — the app uses `tflite_flutter`; iOS + Android.
3. **Broad coverage** — Food V1 covers 2,023 dishes + 1 background class (2,024 total).
   A drop-in replacement should approach this breadth; 101 classes is a regression.
4. **Commercially usable license** — Nutriq is GPL-3.0 and shipped publicly. The model
   and its training data must permit commercial redistribution.
5. **Mobile footprint** — quantizable, sub-3s inference on mid-range phones
   (NFR-2.3 in `docs/requirements.md`).

## Current baseline: Google AIY Food V1

| Property | Value |
|:---|:---|
| Source | `lite-model/aiy/vision/classifier/food_V1/1` on TF Hub |
| Backbone | MobileNet-based |
| Input | `[1, 224, 224, 3]` float32, scaled 0–1 |
| Output | `[1, 2024]` float32 probabilities (no softmax) |
| Classes | 2,023 dishes + 1 background |
| License | Apache-2.0 |
| Label map | `assets/models/food_v1_labelmap.csv` |

The implementation in `FoodClassifierService` is **tightly coupled** to this contract:
hardcoded `_classCount = 2024`, `_inputSize = 224`, and a strict tensor-shape
validator (`_validateModelContract`). A model with different output width or input
size would require code changes, not just an asset swap.

## Candidate alternatives evaluated

### 1. Food-101 fine-tunes (EfficientNet-Lite / MobileNetV3)
- 101 Western-centric dish classes.
- Many community TFLite conversions exist on GitHub/Hugging Face.
- **Problem**: 20x fewer classes than Food V1 — a major coverage regression.
- **License risk**: Food-101 dataset is "research purposes only"; commercial use
  of weights trained on it is legally murky even when the code is MIT/Apache.

### 2. Food2K (~2,000 classes, 1M+ images)
- Closest in breadth to Food V1; strong fine-grained recognition benchmark.
- **Problem**: Released for **non-commercial academic/research use only**.
  Images are web-scraped (third-party copyright). Commercially unusable for Nutriq.

### 3. ISIA Food-500 / FoodX-251 (251–500 classes)
- Broader than Food-101, narrower than Food V1.
- **Problem**: Academic/research licensing; still a coverage regression vs. Food V1.

### 4. UEC-Food256 / UEC-Food256 extensions
- 256 Japanese-cuisine-focused classes.
- **Problem**: Geographic skew, research license, coverage regression.

### 5. Recipe1M / Recipe1M+
- Cross-modal recipe retrieval / generation, not closed-set dish classification.
- **Problem**: Wrong task; dataset is research-only.

### 6. Hugging Face food-classification checkpoints
- Various ViT / EfficientNet fine-tunes; some Apache/MIT on the *code*.
- **Problem**: No turn-key, broad-coverage, TFLite-exported, commercially-clean
  food model exists. Requires manual export (often PyTorch → ONNX → TFLite) and
  per-model license/data provenance review. Coverage rarely exceeds Food-101.

### 7. Cloud vision APIs (Google Cloud Vision, AWS Rekognition, Clarifai)
- Broad coverage, maintained.
- **Problem**: Violates constraint #1 (on-device, privacy-first). Rejected.

## Conclusion

**No ready-to-use, commercially-licensed, broad-coverage (≥2,000 class),
mobile-ready TFLite food classifier exists as a drop-in replacement for Food V1.**
Every public alternative fails at least one of: coverage, license, or mobile
readiness. Food V1 remains the strongest fit for Nutriq's constraints because it
is Apache-2.0, on-device, and covers 2,023 dishes — a combination no surveyed
alternative matches.

## Recommended next steps (if a replacement is still desired)

Ordered by effort, lowest first:

1. **Keep Food V1.** No action; it is the best available option today.
2. **Decouple the service contract.** Parameterize `_classCount` and `_inputSize`
   from the loaded model's tensors instead of hardcoding 2024/224, so a future
   model can be swapped via assets alone. Low-risk, enables options 3–4 later.
3. **Self-fine-tune on permissively-licensed data.** Collect or license food
   imagery with clear commercial rights, fine-tune EfficientNet-Lite or
   MobileNetV3, export INT8-quantized TFLite. Highest control, highest effort,
   and requires solving the data-licensing problem (the actual blocker).
4. **Supplement, don't replace.** Keep Food V1 for breadth; add a small
   user-tunable custom-class stage (few-shot via transfer learning on-device)
   for dishes Food V1 misses. Improves UX without a licensing battle.
