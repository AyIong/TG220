import { Feature } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const bloom_level: Feature<string> = {
  name: 'Bloom strength',
  category: 'GAMEPLAY',
  description: 'Уровень bloom.',
  component: FeatureDropdownInput,
};
